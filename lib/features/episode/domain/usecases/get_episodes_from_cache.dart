import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetEpisodesFromCache extends FNPUC<List<EpisodeEntity>> {
  final EpisodeRepository repository;

  GetEpisodesFromCache(this.repository);

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call() =>
      repository.getEpisodesFromCache();
}
