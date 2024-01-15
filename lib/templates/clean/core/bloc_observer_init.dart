import 'package:cleanapp/common/template/template.dart';

class BlocObserverTemplate extends Template {
  BlocObserverTemplate()
      : super('lib/core/bloc_observer/app_bloc_observer.dart', overwrite: true);

  @override
  String get content => """
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent \$event', name: 'BLOC');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(\${bloc.runtimeType}, \$change)', name: 'BLOC');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition \$transition', name: 'BLOC');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(\${bloc.runtimeType}, \$error, \$stackTrace)', name: 'BLOC');
    super.onError(bloc, error, stackTrace);
  }
}

""";
}
