import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class StateSample extends Template {
  final String feature;

  StateSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(feature).snakeCase}/bloc/${ReCase(feature).snakeCase}_state.dart',
            overwrite: true);

  @override
  String get content => """
part of '${ReCase(feature).snakeCase}_bloc.dart';

class ${ReCase(feature).pascalCase}State extends Equatable {
  const ${ReCase(feature).pascalCase}State();

  @override
  List<Object?> get props => [];
}

class ${ReCase(feature).pascalCase}Initial extends ${ReCase(feature).pascalCase}State {
}

class ${ReCase(feature).pascalCase}Loading extends ${ReCase(feature).pascalCase}State {
}

class ${ReCase(feature).pascalCase}Loaded extends ${ReCase(feature).pascalCase}State {
}

class ${ReCase(feature).pascalCase}Error extends ${ReCase(feature).pascalCase}State {
}
""";
}
