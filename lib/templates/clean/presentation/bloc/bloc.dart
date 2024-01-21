import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class BlocSample extends Template {
  final String feature;
  final String blocName;

  BlocSample(this.feature, this.blocName)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(blocName).snakeCase}/bloc/${ReCase(blocName).snakeCase}_bloc.dart',
            overwrite: true);

  @override
  String get content => """
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part '${ReCase(blocName).snakeCase}_event.dart';
part '${ReCase(blocName).snakeCase}_state.dart';

class ${ReCase(blocName).pascalCase}Bloc extends Bloc<${ReCase(blocName).pascalCase}Event, ${ReCase(blocName).pascalCase}State> {
  ${ReCase(blocName).pascalCase}Bloc() : super(const ${ReCase(blocName).pascalCase}State()) {
    on<${ReCase(blocName).pascalCase}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
  """;
}
