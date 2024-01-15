import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class EntitySample extends Template {
  final String feature;

  EntitySample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/domain/entities/${ReCase(feature).snakeCase}_entity.dart',
            overwrite: true);

  @override
  String get content => """
""";
}
