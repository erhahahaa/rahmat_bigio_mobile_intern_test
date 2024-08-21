import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

abstract class LocationRepository {
  Future<Either<Failure, WithPagination<LocationEntity>>> getLocations();
  Future<Either<Failure, WithPagination<LocationEntity>>>
      getLocationsByPagination(
    Pagination pagination,
  );
  Future<Either<Failure, LocationEntity>> getLocation(
    ByIdParam param,
  );
  Future<Either<Failure, List<LocationEntity>>> getMultipleLocations(
    ByIdsParam param,
  );
  Future<Either<Failure, List<LocationEntity>>> getFilteredLocations(
    GetLocationsByFilterParams params,
  );

  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache();
  Future<Either<Failure, List<LocationEntity>>> getFavoriteLocations();
  Future<Either<Failure, LocationEntity>> toggleFavoriteLocation(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
