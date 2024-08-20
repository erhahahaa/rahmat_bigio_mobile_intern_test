import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';

/// [Future with Params Use Case]
abstract class FPUC<Type, Param> {
  Future<Either<Failure, Type>> call(Param params);
}

/// [Future No Params Use Case]
abstract class FNPUC<Type> {
  Future<Either<Failure, Type>> call();
}
