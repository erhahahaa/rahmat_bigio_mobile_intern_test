import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class LocationLocalDataSource {
  Future<Either<Failure, LocationEntity>> cacheLocation(
    LocationEntity location,
  );
  Future<Either<Failure, List<LocationEntity>>> cacheLocations(
    List<LocationEntity> locations,
  );
  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache();
  Future<Either<Failure, void>> toggleFavoriteLocation(
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
      return Left(
        CacheFailure(message: 'Failed to caching locations'),
      );
    }
    for (final location in cachings) {
      if (location == null) {
        return Left(
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
      return Left(CacheFailure(message: 'Error clearing locations cache'));
    }
    return Right(null);
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache() async {
    final locations = await _isar.instance.locations.where().findAll();

    if (locations.isNotEmpty) {
      return Right(locations);
    } else {
      return Left(CacheFailure(message: 'No locations in cache'));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteLocation(ByIdParam param) async {
    final location = await _isar.instance.locations.get(param.id);
    if (location == null) {
      return Left(CacheFailure(message: 'Location not found in cache'));
    }
    await _isar.instance.writeTxn(() async {
      await cacheLocation(
        LocationModel.fromEntity(location)
            .copyWith(isFavorite: !location.isFavorite)
            .toEntity(),
      );
    });
    return Right(null);
  }
}
