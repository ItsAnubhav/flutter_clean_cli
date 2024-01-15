import 'dart:io';
import 'package:recase/recase.dart';

class FileUtils {
  Map<String, String> paths = {
    "core": replaceAsExpected(path: "lib/core"),
    "features": replaceAsExpected(path: "lib/features"),
  };

  static List<String> getFeatureFolders(String featureName) {
    featureName = ReCase(featureName).snakeCase;
    return [
      replaceAsExpected(path: "lib/features/$featureName/data"),
      replaceAsExpected(path: "lib/features/$featureName/data/datasources"),
      replaceAsExpected(path: "lib/features/$featureName/data/repositories"),
      replaceAsExpected(path: "lib/features/$featureName/data/models"),
      replaceAsExpected(path: "lib/features/$featureName/domain"),
      replaceAsExpected(path: "lib/features/$featureName/domain/usecases"),
      replaceAsExpected(path: "lib/features/$featureName/domain/repositories"),
      replaceAsExpected(path: "lib/features/$featureName/domain/entities"),
      replaceAsExpected(path: "lib/features/$featureName/presentation"),
    ];
  }

  static String getFilePathByName(
      String type, String featureName, String name) {
    featureName = ReCase(featureName).snakeCase;
    name = ReCase(name).snakeCase;
    switch (type) {
      case 'di':
        return replaceAsExpected(path: "lib/core/di/injection.dart");
      case 'routes':
        return replaceAsExpected(path: "lib/core/routes.dart");
      case 'bloc':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_bloc.dart");
      case 'state':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_state.dart");
      case 'event':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_event.dart");
      case 'model':
        return replaceAsExpected(
            path: "lib/features/$featureName/data/models/$name.dart");
      case 'repository':
        return replaceAsExpected(
            path: "lib/features/$featureName/data/repositories/$name.dart");
      case 'datasource':
        return replaceAsExpected(
            path: "lib/features/$featureName/data/datasources/$name.dart");
      case 'usecase':
        return replaceAsExpected(
            path: "lib/features/$featureName/domain/usecases/$name.dart");
      case 'entity':
        return replaceAsExpected(
            path: "lib/features/$featureName/domain/entities/$name.dart");
      case 'screen':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/$name.dart");
      case 'screen_bloc':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_bloc.dart");
      case 'screen_state':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_state.dart");
      case 'screen_event':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/bloc/$name" +
                "_event.dart");
      case 'screen_widget':
        return replaceAsExpected(
            path: "lib/features/$featureName/presentation/$name/widgets/$name" +
                "_widget.dart");
      default:
        return '';
    }
  }

  static List<String> getScreenFolders(String featureName, String screenName) {
    featureName = ReCase(featureName).snakeCase;
    screenName = ReCase(screenName).snakeCase;
    return [
      replaceAsExpected(
          path: "lib/features/$featureName/presentation/$screenName"),
      replaceAsExpected(
          path: "lib/features/$featureName/presentation/$screenName/bloc"),
      replaceAsExpected(
          path: "lib/features/$featureName/presentation/$screenName/widgets"),
    ];
  }

  static createListDirectory(List<Directory> dirs) {
    for (final element in dirs) {
      element.createSync(recursive: true);
    }
  }

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

  static String replaceAsExpected({required String path}) {
    if (path.contains('\\')) {
      if (Platform.isLinux || Platform.isMacOS) {
        return path.replaceAll('\\', '/');
      } else {
        return path;
      }
    } else if (path.contains('/')) {
      if (Platform.isWindows) {
        return path.replaceAll('/', '\\\\');
      } else {
        return path;
      }
    } else {
      return path;
    }
  }

  static String? getPathWithName(String? firstPath, String secondPath,
      {bool createWithWrappedFolder = false, required String? folderName}) {
    late String betweenPaths;
    if (Platform.isWindows) {
      betweenPaths = '\\\\';
    } else if (Platform.isMacOS || Platform.isLinux) {
      betweenPaths = '/';
    }
    if (betweenPaths.isNotEmpty) {
      if (createWithWrappedFolder) {
        return firstPath! +
            betweenPaths +
            folderName! +
            betweenPaths +
            secondPath;
      } else {
        return firstPath! + betweenPaths + secondPath;
      }
    }
    return null;
  }

  static List<String> safeSplitPath(String path) {
    return path.replaceAll('\\', '/').split('/')
      ..removeWhere((element) => element.isEmpty);
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

  static String pathToDirImport(String path) {
    var pathSplit = safeSplitPath(path)
      ..removeWhere((element) => element == '.' || element == 'lib');
    return pathSplit.join('/');
  }
}
