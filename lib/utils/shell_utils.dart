import 'dart:io';

import 'package:cleanapp/utils/logger.dart';
import 'package:process_run/shell_run.dart';

class ShellUtils {
  static Future<void> pubGet() async {
    Logger.info('Running `flutter pub get` …');
    await run('flutter pub get', verbose: true);
  }

  static Future<void> flutterCreate(
    String path,
    String? org,
    String iosLang,
    String androidLang,
  ) async {
    Logger.info('Running `flutter create` …');

    await run(
        'flutter create --no-pub -i $iosLang -a $androidLang --org $org'
        ' "$path"',
        verbose: true);
  }
}
