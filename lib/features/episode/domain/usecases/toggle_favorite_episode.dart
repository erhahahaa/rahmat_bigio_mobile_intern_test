import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class ToggleFavoriteEpisode extends FPUC<void, ByIdParam> {
  final EpisodeRepository repository;

  ToggleFavoriteEpisode(this.repository);

  @override
  Future<Either<Failure, void>> call(
    ByIdParam params,
  ) =>
      repository.toggleFavoriteEpisode(params);
}
