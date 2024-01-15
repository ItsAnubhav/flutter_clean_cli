import 'package:cleanapp/common/template/template.dart';

class UseCaseInitSample extends Template {
  UseCaseInitSample() : super('lib/core/usecase/usecase.dart', overwrite: true);

  @override
  String get content => """
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
""";
}
