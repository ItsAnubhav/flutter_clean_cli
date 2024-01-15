import 'package:cleanapp/cleanapp.dart';
import 'package:cleanapp/utils/logger.dart';

Future<void> main(List<String> arguments) async {
  var time = Stopwatch();
  time.start();
  try {
    final command = CleanApp(arguments).findCommand();
    Logger.success('Command: ${command.name}');
    await command.execute();
    time.stop();
    Logger.info('Time Lapsed: ${time.elapsed.inMilliseconds} Milliseconds');
  } catch (e) {
    Logger.error(e.toString());
  }

  // if (arguments.contains('--debug')) {
  //   if (command.validate()) {
  //     await command.execute().then((value) => checkForUpdate());
  //   }
  // } else {
  //   try {
  //     if (command.validate()) {
  //       await command.execute().then((value) => checkForUpdate());
  //     }
  //   } on Exception catch (e) {
  //     ExceptionHandler().handle(e);
  //   }
  // }
}
