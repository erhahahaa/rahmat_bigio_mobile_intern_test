import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodes();
  Future<Either<Failure, EpisodeEntity>> getEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, List<EpisodeEntity>>> getMultipleEpisodes(
    ByIdsParam param,
  );
  Future<Either<Failure, List<EpisodeEntity>>> getFilteredEpisodes(
    GetEpisodesByFilterParams params,
  );

  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesFromCache();
  Future<Either<Failure, void>> toggleFavoriteEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
