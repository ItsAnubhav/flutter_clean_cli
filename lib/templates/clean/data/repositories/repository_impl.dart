import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class RepoImplSample extends Template {
  final String feature;

  RepoImplSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/data/repositories/${ReCase(feature).snakeCase}_repo_impl.dart',
            overwrite: true);

  @override
  String get content => """
import '../../domain/repositories/${ReCase(feature).snakeCase}_repository.dart';
import '../datasource/${ReCase(feature).snakeCase}_remote_data_source.dart';
import '../datasource/${ReCase(feature).snakeCase}_local_data_source.dart';


class ${ReCase(feature).pascalCase}RepositoryImpl implements ${ReCase(feature).pascalCase}Repository {
  final ${ReCase(feature).pascalCase}RemoteDataSource remoteDataSource;
  final ${ReCase(feature).pascalCase}LocalDataSource localDataSource;

  ${ReCase(feature).pascalCase}RepositoryImpl({required this.remoteDataSource, required this.localDataSource});
  
}
""";
}
