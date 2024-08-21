import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

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
