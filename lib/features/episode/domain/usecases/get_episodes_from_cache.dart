import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetEpisodesFromCache extends FNPUC<List<EpisodeEntity>> {
  final EpisodeRepository repository;

  GetEpisodesFromCache(this.repository);

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call() =>
      repository.getEpisodesFromCache();
}
