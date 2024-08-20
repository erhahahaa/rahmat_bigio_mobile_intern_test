import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class EpisodeRemoteDataSource {
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes();
  Future<Either<Failure, EpisodeModel>> getEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, List<EpisodeModel>>> getMultipleEpisodes(
    ByIdsParam param,
  );
  Future<Either<Failure, List<EpisodeModel>>> getFilteredEpisodes(
    GetEpisodesByFilterParams params,
  );
}
