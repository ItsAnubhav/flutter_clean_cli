import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/commands/create/create_feature_command.dart';
import 'package:cleanapp/commands/create/create_screen_command.dart';
import 'package:cleanapp/commands/init/init_clean.dart';
import 'package:cleanapp/commands/test/test_command.dart';

final List<Command> commands = [
  InitClean(),
  CreateFeature(),
  CreateScreen(),
  TestFeature(),
];
