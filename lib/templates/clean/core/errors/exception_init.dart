import 'package:cleanapp/common/template/template.dart';

class ExceptionInitSample extends Template {
  ExceptionInitSample()
      : super('lib/core/error/exception.dart', overwrite: true);

  @override
  String get content => """
class ServerException implements Exception {}

class CacheException implements Exception {}
""";
}
