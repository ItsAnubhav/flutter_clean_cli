import 'dart:async';

import 'package:cleanapp/cleanapp.dart';
import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/utils/clean_utils.dart';

class TestFeature extends Command {
  TestFeature();

  @override
  String get description => "Create a new feature";

  @override
  Future<void> execute() {
    //Get all arguments
    final arguments = CleanApp.arguments;
    final featureName = arguments.last;
    //Create the feature
    final dependency = CleanUtils.getFeatureDependencies(featureName);
    CleanUtils.addDependencyToGetIt(featureName, dependency);
    //Add screen to route
    return Future.value(null);
  }

  @override
  String get name => "add:test";
}
