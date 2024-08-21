import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

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
