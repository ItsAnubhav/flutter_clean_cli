import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class BlocSample extends Template {
  final String feature;

  BlocSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(feature).snakeCase}/bloc/${ReCase(feature).snakeCase}_bloc.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '${ReCase(feature).snakeCase}_event.dart';
part '${ReCase(feature).snakeCase}_state.dart';

class ${ReCase(feature).pascalCase}Bloc extends Bloc<${ReCase(feature).pascalCase}Event, ${ReCase(feature).pascalCase}State> {
  ${ReCase(feature).pascalCase}Bloc() : super(const ${ReCase(feature).pascalCase}State()) {
    on<${ReCase(feature).pascalCase}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
  """;
}
