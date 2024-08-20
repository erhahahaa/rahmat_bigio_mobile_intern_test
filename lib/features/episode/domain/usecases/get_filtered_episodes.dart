import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetFilteredEpisodes
    extends FPUC<List<EpisodeEntity>, GetEpisodesByFilterParams> {
  final EpisodeRepository repository;

  GetFilteredEpisodes(this.repository);

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call(
    GetEpisodesByFilterParams params,
  ) =>
      repository.getFilteredEpisodes(params);
}
