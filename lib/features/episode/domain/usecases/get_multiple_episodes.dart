import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

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
