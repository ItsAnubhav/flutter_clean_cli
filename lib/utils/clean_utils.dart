import 'dart:io';

import 'package:cleanapp/utils/file_utils.dart';
import 'package:dart_style/dart_style.dart';
import 'package:recase/recase.dart';

class CleanUtils {
  static bool checkIfCleanArchProject() {
    if (!Directory('lib/core').existsSync()) {
      //throw Exception('This is not a clean architecture project');
      return false;
    }
    if (!Directory('lib/features').existsSync()) {
      //throw Exception('This is not a clean architecture project');
      return false;
    }
    return true;
  }

  static bool checkIfFeatureExists(String featureName) {
    if (Directory('lib/features/$featureName').existsSync()) {
      //throw Exception('Feature already exists');
      return true;
    }
    return false;
  }

  static void addDependencyToGetIt(String featureName, String dependencies) {
    final getItPath =
        FileUtils.replaceAsExpected(path: 'lib/core/di/injection.dart');
    final getItFile = File(getItPath);
    final lines = getItFile.readAsLinesSync();
    final index = lines.lastIndexOf('}');
    final newLines = lines.sublist(0, index);
    newLines.add(dependencies);
    newLines.add("}");
    newLines.addAll(lines.sublist(index + 1));
    String contents = DartFormatter().format(newLines.join('\n'));
    getItFile.writeAsStringSync(contents);
  }

  static void addDependencyToRoutes(String featureName, String screenName) {
    final routesPath =
        FileUtils.replaceAsExpected(path: 'lib/core/routes.dart');
    final routesFile = File(routesPath);
    final lines = routesFile.readAsLinesSync();
    final index = lines.indexWhere((element) => element.contains('}'));
    final newLines = lines.sublist(0, index + 1);
    newLines.add("  static const $screenName = '/$screenName';");
    newLines.addAll(lines.sublist(index + 1));
    routesFile.writeAsStringSync(newLines.join('\n'));
  }

  static void addImportsToFile(String filePath, String import) {
    final file = File(filePath);
    final lines = file.readAsLinesSync();
    final index = lines.lastIndexWhere((element) => element.contains('import'));
    final newLines = lines.sublist(0, index + 1);
    newLines.add(import);
    newLines.addAll(lines.sublist(index + 1));
    file.writeAsStringSync(newLines.join('\n'));
  }

  static String getFeatureDependencies(String featureName) {
    final featureNameSnakeCase = ReCase(featureName).snakeCase;
    return """
    // ${ReCase(featureName).pascalCase} Feature
    getIt.registerLazySingleton<${ReCase(featureName).pascalCase}LocalDataSource>(() =>
      ${ReCase(featureName).pascalCase}LocalDataSourceImpl(
          sharedPreferences: getIt(), appDatabase: getIt()));
    getIt.registerLazySingleton<${ReCase(featureName).pascalCase}RemoteDataSource>(
        () => ${ReCase(featureName).pascalCase}RemoteDataSourceImpl(dio: getIt()));
    getIt.registerLazySingleton<${ReCase(featureName).pascalCase}Repository>(() => ${ReCase(featureName).pascalCase}RepositoryImpl(
        ${ReCase(featureName).camelCase}LocalDataSource: getIt(), ${ReCase(featureName).camelCase}RemoteDataSource: getIt()));
    """;
  }
}
