import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> registerDependncies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  //New dependencies here

  // Splash Feature
  getIt.registerLazySingleton<SplashLocalDataSource>(() =>
      SplashLocalDataSourceImpl(
          sharedPreferences: getIt(), appDatabase: getIt()));
  getIt.registerLazySingleton<SplashRemoteDataSource>(
      () => SplashRemoteDataSourceImpl(dio: getIt()));
  getIt.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl(
      splashLocalDataSource: getIt(), splashRemoteDataSource: getIt()));
}
