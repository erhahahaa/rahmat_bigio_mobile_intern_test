import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class GetEpisodes extends FNPUC<List<EpisodeEntity>> {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, List<EpisodeEntity>>> call() =>
      repository.getEpisodes();
}
