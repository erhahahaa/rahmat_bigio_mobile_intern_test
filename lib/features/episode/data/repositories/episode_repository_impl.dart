import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/errors/failure.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/helpers/helpers.dart';
import 'package:hidayatullah/utils/params/by_id_param.dart';
import 'package:hidayatullah/utils/params/by_ids_param.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: EpisodeRepository)
class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeLocalDataSource _local;
  final EpisodeRemoteDataSource _remote;

  EpisodeRepositoryImpl(this._local, this._remote);

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      return await _local.clearCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EpisodeEntity>> getEpisode(ByIdParam param) async {
    try {
      final result = await _remote.getEpisode(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entity = r.toEntity();
          await _local.cacheEpisode(entity);
          return Right(entity);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WithPagination<EpisodeEntity>>> getEpisodes() async {
    try {
      final result = await _remote.getEpisodes();
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.results.map((e) => e.toEntity()).toList();
          await _local.cacheEpisodes(entities);
          final chars = await _local.getEpisodesFromCache();
          return Right(WithPagination<EpisodeEntity>(
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
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesFromCache() async {
    try {
      return await _local.getEpisodesFromCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getFilteredEpisodes(
      GetEpisodesByFilterParams params) async {
    try {
      final result = await _remote.getFilteredEpisodes(params);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheEpisodes(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getMultipleEpisodes(
      ByIdsParam param) async {
    try {
      final result = await _remote.getMultipleEpisodes(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheEpisodes(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, EpisodeEntity>> toggleFavoriteEpisode(
      ByIdParam param) async {
    try {
      return await _local.toggleFavoriteEpisode(param);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getFavoriteEpisodes() async {
    try {
      return await _local.getFavoriteEpisodes();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WithPagination<EpisodeEntity>>>
      getEpisodesByPagination(Pagination pagination) async {
    try {
      final result = await _remote.getEpisodesByPagination(pagination);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.results.map((e) => e.toEntity()).toList();
          await _local.cacheEpisodes(entities);
          return Right(WithPagination<EpisodeEntity>(
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
