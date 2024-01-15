import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class RemoteDataSourceSample extends Template {
  final String feature;

  RemoteDataSourceSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/data/datasource/${ReCase(feature).snakeCase}_remote_data_source.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:dio/dio.dart';

abstract class ${ReCase(feature).pascalCase}RemoteDataSource {
}

class ${ReCase(feature).pascalCase}RemoteDataSourceImpl implements ${ReCase(feature).pascalCase}RemoteDataSource {
  final Dio dio;
  ${ReCase(feature).pascalCase}RemoteDataSourceImpl(this.dio);
}
""";
}
