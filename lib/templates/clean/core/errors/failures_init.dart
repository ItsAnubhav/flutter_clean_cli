import 'package:cleanapp/common/template/template.dart';

class FailuresInitSample extends Template {
  FailuresInitSample() : super('lib/core/error/failures.dart', overwrite: true);

  @override
  String get content => """
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
""";
}
