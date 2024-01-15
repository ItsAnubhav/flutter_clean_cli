import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class RepoSample extends Template {
  final String feature;

  RepoSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/domain/repositories/${ReCase(feature).snakeCase}_repository.dart',
            overwrite: true);

  @override
  String get content => """
abstract class ${ReCase(feature).pascalCase}Repository {
  
}
""";
}
