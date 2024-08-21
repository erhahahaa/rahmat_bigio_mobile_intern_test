import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, WithPagination<EpisodeEntity>>> getEpisodes();
  Future<Either<Failure, WithPagination<EpisodeEntity>>>
      getEpisodesByPagination(
    Pagination pagination,
  );
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
  Future<Either<Failure, List<EpisodeEntity>>> getFavoriteEpisodes();
  Future<Either<Failure, EpisodeEntity>> toggleFavoriteEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
