import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class StateSample extends Template {
  final String feature;
  final String screen;

  StateSample(this.feature, this.screen)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(screen).snakeCase}/bloc/${ReCase(screen).snakeCase}_state.dart',
            overwrite: true);

  @override
  String get content => """
part of '${ReCase(screen).snakeCase}_bloc.dart';

sealed class ${ReCase(screen).pascalCase}State extends Equatable {
  const ${ReCase(screen).pascalCase}State();

  @override
  List<Object?> get props => [];
}

class ${ReCase(screen).pascalCase}Initial extends ${ReCase(screen).pascalCase}State {
}

class ${ReCase(screen).pascalCase}Loading extends ${ReCase(screen).pascalCase}State {
}

class ${ReCase(screen).pascalCase}Loaded extends ${ReCase(screen).pascalCase}State {
}

class ${ReCase(screen).pascalCase}Error extends ${ReCase(screen).pascalCase}State {
}
""";
}
