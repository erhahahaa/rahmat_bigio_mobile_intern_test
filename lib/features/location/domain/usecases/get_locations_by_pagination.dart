import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetLocationsByPagination
    extends FPUC<WithPagination<LocationEntity>, Pagination> {
  final LocationRepository _repository;

  GetLocationsByPagination(this._repository);

  @override
  Future<Either<Failure, WithPagination<LocationEntity>>> call(
    Pagination params,
  ) {
    return _repository.getLocationsByPagination(params);
  }
}
