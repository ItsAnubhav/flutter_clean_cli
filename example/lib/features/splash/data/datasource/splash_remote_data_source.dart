import 'package:dio/dio.dart';

abstract class SplashRemoteDataSource {
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final Dio dio;
  SplashRemoteDataSourceImpl(this.dio);
}
