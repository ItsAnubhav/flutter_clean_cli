import '../../domain/repositories/splash_repository.dart';
import '../datasource/splash_remote_data_source.dart';
import '../datasource/splash_local_data_source.dart';


class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDataSource remoteDataSource;
  final SplashLocalDataSource localDataSource;

  SplashRepositoryImpl({required this.remoteDataSource, required this.localDataSource});
  
}
