import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/utils/logger.dart';

class ErrorCommand extends Command {
  final String message;
  const ErrorCommand(this.message);

  @override
  String get name => 'error';

  @override
  String get description => 'Error command';

  @override
  Future<void> execute() async {
    Logger.error("Error: $message");
  }
}
