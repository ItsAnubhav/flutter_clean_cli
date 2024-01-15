import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/app_constants.dart';
import 'core/themes/custom_theme.dart';
import 'core/bloc_observer/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
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
      ),
    );
  }
}
