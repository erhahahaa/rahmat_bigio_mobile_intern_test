import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetMultipleEpisodes extends FPUC<List<EpisodeEntity>, ByIdsParam> {
  final EpisodeRepository repository;

  GetMultipleEpisodes(this.repository);

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call(
    ByIdsParam params,
  ) =>
      repository.getMultipleEpisodes(params);
}
