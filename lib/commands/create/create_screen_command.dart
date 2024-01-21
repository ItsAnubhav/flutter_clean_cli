import 'dart:async';

import 'package:cleanapp/cleanapp.dart';
import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/templates/clean/data/datasource/local_datasource.dart';
import 'package:cleanapp/templates/clean/data/datasource/remote_datasource.dart';
import 'package:cleanapp/templates/clean/data/model/model.dart';
import 'package:cleanapp/templates/clean/data/repositories/repository_impl.dart';
import 'package:cleanapp/templates/clean/domain/entity/entity.dart';
import 'package:cleanapp/templates/clean/domain/repositories/repository.dart';
import 'package:cleanapp/templates/clean/domain/usecase/usecase.dart';
import 'package:cleanapp/templates/clean/presentation/bloc/bloc.dart';
import 'package:cleanapp/templates/clean/presentation/bloc/event.dart';
import 'package:cleanapp/templates/clean/presentation/bloc/state.dart';
import 'package:cleanapp/templates/clean/presentation/page/page.dart';
import 'package:cleanapp/utils/clean_utils.dart';
import 'package:cleanapp/utils/logger.dart';
import 'package:cleanapp/utils/menu.dart';
import 'package:cleanapp/utils/pubspec_utils.dart';

class CreateScreen extends Command {
  CreateScreen();

  @override
  String get description => "Create a new screen in a feature";

  @override
  Future<void> execute() {
    //Get all arguments
    final arguments = CleanApp.arguments;
    final featureName = arguments.last;
    final screenName = arguments[1];
    Logger.info("Creating screen $screenName in feature $featureName");
    //Check if the project is clean arch
    bool isCleanArch = CleanUtils.checkIfCleanArchProject();
    //Check if dependencies is installed
    PubspecUtils.containsPackage("flutter_bloc");
    //Check if the feature already exists
    bool doesFeatureExist = CleanUtils.checkIfFeatureExists(featureName);
    if (!doesFeatureExist) {
      Logger.error("Feature $featureName does not exist");
      return Future.value(null);
    }
    //Create the feature
    createScreen(featureName, screenName);
    //createFeature(featureName);
    return Future.value(null);
  }

  FutureOr<void> createScreen(String featureName, String screenName) {
    Logger.info("Creating directories and files for $featureName");
    //create all files
    BlocSample(featureName, screenName).create();
    EventSample(featureName, screenName).create();
    StateSample(featureName, screenName).create();
    PageSample(featureName, screenName).create();
  }

  @override
  String get name => "create:screen";
}
