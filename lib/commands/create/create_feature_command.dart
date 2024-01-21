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

class CreateFeature extends Command {
  CreateFeature();

  @override
  String get description => "Create a new feature";

  @override
  Future<void> execute() {
    //Get all arguments
    final arguments = CleanApp.arguments;
    final featureName = arguments.last;
    //Check if the project is clean arch
    bool isCleanArch = CleanUtils.checkIfCleanArchProject();
    //Check if dependencies is installed
    PubspecUtils.containsPackage("flutter_bloc");
    //Check if the feature already exists
    bool doesFeatureExist = CleanUtils.checkIfFeatureExists(featureName);
    if (doesFeatureExist) {
      Menu featureExists = Menu(["Yes", "No"],
          title: "Feature already exists. Do you want to overwrite it?");
      Answer answer = featureExists.choose();
      if (answer.index == 0) {
        //Overwrite the feature
      } else {
        //Do not overwrite the feature
        return Future.value(null);
      }
    }

    //Create the feature
    createFeature(featureName);
    return Future.value(null);
  }

  FutureOr<void> createFeature(String featureName) {
    Logger.info("Creating directories and files for $featureName");
    //create all files
    LocalDataSourceSample(featureName).create();
    RemoteDataSourceSample(featureName).create();
    RepoImplSample(featureName).create();
    ModelSample(featureName).create();
    RepoSample(featureName).create();
    UseCaseSample(featureName).create();
    EntitySample(featureName).create();
    BlocSample(featureName, featureName).create();
    EventSample(featureName, featureName).create();
    StateSample(featureName, featureName).create();
    PageSample(featureName, featureName).create();
    //add dependencies to di
    final dependency = CleanUtils.getFeatureDependencies(featureName);
    CleanUtils.addDependencyToGetIt(featureName, dependency);
    //add page route to routes file
  }

  @override
  String get name => "create:feature";
}
