import 'package:cleanapp/common/template/template.dart';
import 'package:recase/recase.dart';

class ModelSample extends Template {
  final String feature;

  ModelSample(this.feature)
      : super(
            'lib/features/${ReCase(feature).snakeCase}/data/models/${ReCase(feature).snakeCase}_model.dart',
            overwrite: true);

  @override
  String get content => """
""";
}
