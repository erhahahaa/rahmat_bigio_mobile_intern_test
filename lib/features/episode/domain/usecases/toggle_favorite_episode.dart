import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToggleFavoriteEpisode extends FPUC<EpisodeEntity, ByIdParam> {
  final EpisodeRepository repository;

  ToggleFavoriteEpisode(this.repository);

  @override
  Future<Either<Failure, EpisodeEntity>> call(
    ByIdParam params,
  ) =>
      repository.toggleFavoriteEpisode(params);
}
