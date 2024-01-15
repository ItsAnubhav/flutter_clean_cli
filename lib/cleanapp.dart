import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/commands/commands.dart';

import 'commands/errors/error_command.dart';

class CleanApp {
  final List<String> _arguments;

  CleanApp(this._arguments) {
    _instance = this;
  }

  static CleanApp? _instance;
  static CleanApp? get to => _instance;

  static List<String> get arguments => to!._arguments;

  Command findCommand() => _findCommand(commands);

  Command _findCommand(List<Command> commands) {
    final command =
        commands.where((command) => command.name == arguments.first).toList();

    if (command.isEmpty) {
      return ErrorCommand('Command not found');
    } else {
      return command.first;
    }
  }
}
