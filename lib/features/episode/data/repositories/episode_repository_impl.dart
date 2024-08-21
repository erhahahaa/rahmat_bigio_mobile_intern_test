import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/params/by_id_param.dart';
import 'package:rick_morty/utils/params/by_ids_param.dart';

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
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes() async {
    try {
      final result = await _remote.getEpisodes();
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
  Future<Either<Failure, void>> toggleFavoriteEpisode(ByIdParam param) async {
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
}
