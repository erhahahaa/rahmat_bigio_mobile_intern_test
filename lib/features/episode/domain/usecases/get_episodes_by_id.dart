import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetEpisodesById extends FPUC<EpisodeEntity, ByIdParam> {
  final EpisodeRepository repository;

  GetEpisodesById(this.repository);

  @override
  Future<Either<Failure, EpisodeEntity>> call(
    ByIdParam params,
  ) =>
      repository.getEpisode(params);
}
