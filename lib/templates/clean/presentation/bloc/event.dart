import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class EventSample extends Template {
  final String feature;

  EventSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/presentation/${ReCase(feature).snakeCase}/bloc/${ReCase(feature).snakeCase}_event.dart',
            overwrite: true);

  @override
  String get content => """
part of '${ReCase(feature).snakeCase}_bloc.dart';

sealed class ${ReCase(feature).pascalCase}Event extends Equatable {
  const ${ReCase(feature).pascalCase}Event();

  @override
  List<Object?> get props => [];
}

class ${ReCase(feature).pascalCase}InitialEvent extends ${ReCase(feature).pascalCase}Event {
}
""";
}
