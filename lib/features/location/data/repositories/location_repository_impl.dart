import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/params/by_id_param.dart';
import 'package:rick_morty/utils/params/by_ids_param.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationLocalDataSource _local;
  final LocationRemoteDataSource _remote;

  LocationRepositoryImpl(this._local, this._remote);

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      return await _local.clearCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LocationEntity>> getLocation(ByIdParam param) async {
    try {
      final result = await _remote.getLocation(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entity = r.toEntity();
          await _local.cacheLocation(entity);
          return Right(entity);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations() async {
    try {
      final result = await _remote.getLocations();
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheLocations(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocationsFromCache() async {
    try {
      return await _local.getLocationsFromCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getFilteredLocations(
      GetLocationsByFilterParams params) async {
    try {
      final result = await _remote.getFilteredLocations(params);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheLocations(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getMultipleLocations(
      ByIdsParam param) async {
    try {
      final result = await _remote.getMultipleLocations(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheLocations(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteLocation(ByIdParam param) async {
    try {
      return await _local.toggleFavoriteLocation(param);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
