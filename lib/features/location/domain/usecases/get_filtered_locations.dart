import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

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
