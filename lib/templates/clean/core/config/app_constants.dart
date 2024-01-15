import 'package:cleanapp/common/template/template.dart';

class AppConstantSample extends Template {
  AppConstantSample()
      : super('lib/core/config/app_constants.dart', overwrite: true);

  @override
  String get content => """
class AppConstants {
  static const appName = 'Flutter Starter';
}
""";
}
