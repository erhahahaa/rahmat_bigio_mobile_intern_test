import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/errors/failure.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/helpers/helpers.dart';
import 'package:hidayatullah/utils/params/by_id_param.dart';
import 'package:hidayatullah/utils/params/by_ids_param.dart';
import 'package:injectable/injectable.dart';

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
  Future<Either<Failure, WithPagination<LocationEntity>>> getLocations() async {
    try {
      final result = await _remote.getLocations();
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.results.map((e) => e.toEntity()).toList();
          await _local.cacheLocations(entities);
          final chars = await _local.getLocationsFromCache();
          return Right(WithPagination<LocationEntity>(
            info: r.info,
            results: chars.getOrElse(() => []),
          ));
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
  Future<Either<Failure, LocationEntity>> toggleFavoriteLocation(
      ByIdParam param) async {
    try {
      return await _local.toggleFavoriteLocation(param);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getFavoriteLocations() async {
    try {
      return await _local.getFavoriteLocations();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WithPagination<LocationEntity>>>
      getLocationsByPagination(Pagination pagination) async {
    try {
      final result = await _remote.getLocationsByPagination(pagination);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.results.map((e) => e.toEntity()).toList();
          await _local.cacheLocations(entities);
          return Right(WithPagination<LocationEntity>(
            info: r.info,
            results: entities,
          ));
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
