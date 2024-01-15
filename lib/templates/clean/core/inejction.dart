import 'package:cleanapp/common/template/template.dart';

class InjectionTemplate extends Template {
  InjectionTemplate() : super('lib/core/di/injection.dart', overwrite: true);

  @override
  String get content => """
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> registerDependncies() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => prefs);

  //New dependencies here
  
}

""";
}
