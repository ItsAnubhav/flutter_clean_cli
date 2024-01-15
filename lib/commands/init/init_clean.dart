import 'dart:async';

import 'package:cleanapp/cleanapp.dart';
import 'package:cleanapp/commands/command.dart';
import 'package:cleanapp/templates/clean/clean_main.dart';
import 'package:cleanapp/templates/clean/core/bloc_observer_init.dart';
import 'package:cleanapp/templates/clean/core/config/app_constants.dart';
import 'package:cleanapp/templates/clean/core/config_example.dart';
import 'package:cleanapp/templates/clean/core/errors/failures_init.dart';
import 'package:cleanapp/templates/clean/core/inejction.dart';
import 'package:cleanapp/templates/clean/core/network/api_client.dart';
import 'package:cleanapp/templates/clean/core/themes/palette.dart';
import 'package:cleanapp/templates/clean/core/themes/themes.dart';
import 'package:cleanapp/templates/clean/core/themes/typography.dart';
import 'package:cleanapp/templates/clean/core/usecase/usecase_init.dart';
import 'package:cleanapp/utils/clean_utils.dart';
import 'package:cleanapp/utils/menu.dart';
import 'package:cleanapp/utils/pubspec_utils.dart';

class InitClean extends Command {
  InitClean();

  @override
  String get description => "Create a new feature";

  @override
  Future<void> execute() async {
    //Get all arguments
    final arguments = CleanApp.arguments;
    //Check if the project is clean arch
    bool isCleanArch = CleanUtils.checkIfCleanArchProject();
    //Check if dependencies is installed
    await PubspecUtils.addDependencies("dio", runPubGet: false);
    await PubspecUtils.addDependencies("pretty_dio_logger", runPubGet: false);
    await PubspecUtils.addDependencies("flutter_bloc", runPubGet: false);
    await PubspecUtils.addDependencies("equatable", runPubGet: false);
    await PubspecUtils.addDependencies("get_it", runPubGet: false);
    await PubspecUtils.addDependencies("shared_preferences", runPubGet: false);
    await PubspecUtils.addDependencies("google_fonts", runPubGet: false);
    await PubspecUtils.addDependencies("dartz", runPubGet: false);
    await PubspecUtils.addDependencies("go_router", runPubGet: false);
    //Check if the feature already exists
    bool doesFeatureExist = CleanUtils.checkIfFeatureExists("featureName");
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
    initClearArch();
    //Create the feature
    return Future.value(null);
  }

  FutureOr<void> initClearArch() {
    //Main
    CleanMainSample().create();
    //Core
    AppConstantSample().create();
    ConfigExampleSample().create();
    FailuresInitSample().create();
    ThemesInitSample().create();
    PaletteTemplate().create();
    TypographyTemplate().create();
    NetworkTemplate().create();
    UseCaseInitSample().create();
    BlocObserverTemplate().create();
    InjectionTemplate().create();
  }

  @override
  String get name => "init:clean";
}
