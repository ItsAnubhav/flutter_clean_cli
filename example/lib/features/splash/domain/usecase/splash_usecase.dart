import 'package:dartz/dartz.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/splash_repository.dart';

class SplashUseCase extends UseCase<void, SplashUseCaseParams> {
  final SplashRepository repository;

  SplashUseCase(this.repository);

  @override
  Future<Either<String, void>> call(SplashUseCaseParams params) async {
    throw UnimplementedError();
  }
}

class SplashUseCaseParams {
  final String param1;
  final String param2;

  SplashUseCaseParams(this.param1, this.param2);
}
