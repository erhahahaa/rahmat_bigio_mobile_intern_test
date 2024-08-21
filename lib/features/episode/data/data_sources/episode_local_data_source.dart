import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class EpisodeLocalDataSource {
  Future<Either<Failure, EpisodeEntity>> cacheEpisode(
    EpisodeEntity episode,
  );
  Future<Either<Failure, List<EpisodeEntity>>> cacheEpisodes(
    List<EpisodeEntity> episodes,
  );
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesFromCache();
  Future<Either<Failure, List<EpisodeEntity>>> getFavoriteEpisodes();
  Future<Either<Failure, void>> toggleFavoriteEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: EpisodeLocalDataSource)
class EpisodeLocalDataSourceImpl implements EpisodeLocalDataSource {
  final IsarClient _isar;

  EpisodeLocalDataSourceImpl(this._isar);

  @override
  Future<Either<Failure, EpisodeEntity>> cacheEpisode(
    EpisodeEntity episode,
  ) async {
    final caching = await _isar.instance.writeTxn(() async {
      final id = await _isar.instance.episodes.put(episode);
      return await _isar.instance.episodes.get(id);
    });

    if (caching == null) {
      return Left(
        CacheFailure(message: 'Failed to caching ${episode.name}'),
      );
    }
    return Right(caching);
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> cacheEpisodes(
    List<EpisodeEntity> episodes,
  ) async {
    final cachings = await _isar.instance.writeTxn(() async {
      final ids = await _isar.instance.episodes.putAll(episodes);
      return await _isar.instance.episodes.getAll(ids);
    });
    if (cachings.isEmpty) {
      return Left(
        CacheFailure(message: 'Failed to caching episodes'),
      );
    }
    for (final episode in cachings) {
      if (episode == null) {
        return Left(
          CacheFailure(message: 'Failed to caching episode'),
        );
      }
    }
    return Right(episodes);
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    await _isar.instance.writeTxn(() async {
      await _isar.instance.episodes.clear();
    });
    final check = await _isar.instance.episodes.count();
    if (check != 0) {
      return Left(CacheFailure(message: 'Error clearing episodes cache'));
    }
    return Right(null);
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesFromCache() async {
    final episodes = await _isar.instance.episodes.where().findAll();

    if (episodes.isNotEmpty) {
      return Right(episodes);
    } else {
      return Left(CacheFailure(message: 'No episodes in cache'));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteEpisode(ByIdParam param) async {
    final episode = await _isar.instance.episodes.get(param.id);
    if (episode == null) {
      return Left(CacheFailure(message: 'Episode not found in cache'));
    }
    await cacheEpisode(
      EpisodeModel.fromEntity(episode)
          .copyWith(isFavorite: !episode.isFavorite)
          .toEntity(),
    );
    return Right(null);
  }

  @override
  Future<Either<Failure, List<EpisodeEntity>>> getFavoriteEpisodes() async {
    final episodes = await _isar.instance.episodes
        .where()
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
    if (episodes.isNotEmpty) {
      return Right(episodes);
    } else {
      return Left(CacheFailure(message: 'No favorite episodes in cache'));
    }
  }
}
