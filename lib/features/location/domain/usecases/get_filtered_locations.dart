import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFilteredLocations
    extends FPUC<List<LocationEntity>, GetLocationsByFilterParams> {
  final LocationRepository repository;

  GetFilteredLocations(this.repository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call(
    GetLocationsByFilterParams params,
  ) =>
      repository.getFilteredLocations(params);
}
