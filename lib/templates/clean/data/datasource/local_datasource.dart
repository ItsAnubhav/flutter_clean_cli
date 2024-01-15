import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class LocalDataSourceSample extends Template {
  final String feature;

  LocalDataSourceSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/data/datasource/${ReCase(feature).snakeCase}_local_data_source.dart',
            overwrite: true);

  @override
  String get content => """
abstract class ${ReCase(feature).pascalCase}LocalDataSource {
}

class ${ReCase(feature).pascalCase}LocalDataSourceImpl implements ${ReCase(feature).pascalCase}LocalDataSource {
  
  ${ReCase(feature).pascalCase}LocalDataSourceImpl();
}
""";
}
