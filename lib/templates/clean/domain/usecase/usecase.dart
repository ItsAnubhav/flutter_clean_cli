import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class UseCaseSample extends Template {
  final String feature;

  UseCaseSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/domain/usecase/${ReCase(feature).snakeCase}_usecase.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/${ReCase(feature).snakeCase}_repository.dart';

class ${ReCase(feature).pascalCase}UseCase extends UseCase<void, ${ReCase(feature).pascalCase}UseCaseParams> {
  final ${ReCase(feature).pascalCase}Repository repository;

  ${ReCase(feature).pascalCase}UseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(${ReCase(feature).pascalCase}UseCaseParams params) async {
    throw UnimplementedError();
  }
}

class ${ReCase(feature).pascalCase}UseCaseParams {
  final String param1;
  final String param2;

  ${ReCase(feature).pascalCase}UseCaseParams(this.param1, this.param2);
}
""";
}
