import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class LocationRemoteDataSource {
  Future<Either<Failure, List<LocationModel>>> getLocations();
  Future<Either<Failure, LocationModel>> getLocation(
    ByIdParam param,
  );
  Future<Either<Failure, List<LocationModel>>> getMultipleLocations(
    ByIdsParam param,
  );
  Future<Either<Failure, List<LocationModel>>> getFilteredLocations(
    GetLocationsByFilterParams params,
  );
}
