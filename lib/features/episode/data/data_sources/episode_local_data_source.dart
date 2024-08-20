import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class EpisodeLocalDataSource {
  Future<Either<Failure, List<EpisodeEntity>>> getEpisodesFromCache();
  Future<Either<Failure, void>> toggleFavoriteEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
