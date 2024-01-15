import 'package:dcli/dcli.dart';

class Logger {
  static void success(String message) {
    print(green(message));
  }

  static void info(String message) {
    print(cyan(message));
  }

  static void warning(String message) {
    print(yellow(message));
  }

  static void error(String message) {
    print(red(message));
  }
}
