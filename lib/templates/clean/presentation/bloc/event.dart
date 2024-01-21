import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class EventSample extends Template {
  final String feature;
  final String screen;

  EventSample(this.feature, this.screen)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(screen).snakeCase}/bloc/${ReCase(screen).snakeCase}_event.dart',
            overwrite: true);

  @override
  String get content => """
part of '${ReCase(screen).snakeCase}_bloc.dart';

sealed class ${ReCase(screen).pascalCase}Event extends Equatable {
  const ${ReCase(screen).pascalCase}Event();

  @override
  List<Object?> get props => [];
}

class ${ReCase(screen).pascalCase}InitialEvent extends ${ReCase(screen).pascalCase}Event {
}
""";
}
