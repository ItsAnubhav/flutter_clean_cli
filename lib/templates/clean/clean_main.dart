import 'package:cleanapp/common/template/template.dart';

class CleanMainSample extends Template {
  CleanMainSample() : super('lib/main.dart', overwrite: true);

  @override
  String get content => '''
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_constants.dart';
import 'core/routes/route_generator.dart';
import 'core/routes/routes.dart';
import 'core/themes/custom_theme.dart';
import 'core/bloc_observer/app_bloc_observer.dart';
import 'core/config/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
            title: AppConstants.appName,
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
            initialRoute: Routes.splash),
    );
  }
}''';
}
