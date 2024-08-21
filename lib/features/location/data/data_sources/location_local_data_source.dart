import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class LocationLocalDataSource {
  Future<Either<Failure, LocationEntity>> cacheLocation(
    LocationEntity location,
  );
  Future<Either<Failure, List<LocationEntity>>> cacheLocations(
    List<LocationEntity> locations,
  );
  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache();
  Future<Either<Failure, List<LocationEntity>>> getFavoriteLocations();
  Future<Either<Failure, List<LocationEntity>>> getLocationsByIds(
    ByIdsParam param,
  );
  Future<Either<Failure, LocationEntity>> toggleFavoriteLocation(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: LocationLocalDataSource)
class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final IsarClient _isar;

  LocationLocalDataSourceImpl(this._isar);

  @override
  Future<Either<Failure, LocationEntity>> cacheLocation(
    LocationEntity location,
  ) async {
    final caching = await _isar.instance.writeTxn(() async {
      final id = await _isar.instance.locations.put(location);
      return await _isar.instance.locations.get(id);
    });

    if (caching == null) {
      return Left(
        CacheFailure(message: 'Failed to caching ${location.name}'),
      );
    }
    return Right(caching);
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> cacheLocations(
    List<LocationEntity> locations,
  ) async {
    final cachings = await _isar.instance.writeTxn(() async {
      final ids = await _isar.instance.locations.putAll(locations);
      return await _isar.instance.locations.getAll(ids);
    });
    if (cachings.isEmpty) {
      return const Left(
        CacheFailure(message: 'Failed to caching locations'),
      );
    }
    for (final location in cachings) {
      if (location == null) {
        return const Left(
          CacheFailure(message: 'Failed to caching location'),
        );
      }
    }
    return Right(locations);
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    await _isar.instance.writeTxn(() async {
      await _isar.instance.locations.clear();
    });
    final check = await _isar.instance.locations.count();
    if (check != 0) {
      return const Left(
          CacheFailure(message: 'Error clearing locations cache'));
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache() async {
    final locations = await _isar.instance.locations.where().findAll();

    if (locations.isNotEmpty) {
      return Right(locations);
    } else {
      return const Left(CacheFailure(message: 'No locations in cache'));
    }
  }

  @override
  Future<Either<Failure, LocationEntity>> toggleFavoriteLocation(
      ByIdParam param) async {
    final location = await _isar.instance.locations.get(param.id);
    if (location == null) {
      return const Left(CacheFailure(message: 'Location not found in cache'));
    }
    return await cacheLocation(
      LocationModel.fromEntity(location)
          .copyWith(
            isFavorite: !location.isFavorite,
          )
          .toEntity(),
    );
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getFavoriteLocations() async {
    final locations = await _isar.instance.locations
        .where()
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
    if (locations.isEmpty) {
      return const Left(
          CacheFailure(message: 'No favorite locations in cache'));
    }
    return Right(locations);
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocationsByIds(
    ByIdsParam param,
  ) async {
    final locations = await _isar.instance.locations.getAll(param.ids);
    if (locations.isEmpty) {
      return const Left(CacheFailure(message: 'No locations in cache'));
    }
    final temp = <LocationEntity>[];
    for (final location in locations) {
      if (location == null) {
        return const Left(CacheFailure(message: 'Failed to get location'));
      } else {
        temp.add(location);
      }
    }

    return Right(temp);
  }
}
