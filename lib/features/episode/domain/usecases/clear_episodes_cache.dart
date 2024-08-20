import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

@lazySingleton
class ClearEpisodesCache extends FNPUC<void> {
  final EpisodeRepository repository;

  ClearEpisodesCache(this.repository);

  @override
  Future<Either<Failure, void>> call() => repository.clearCache();
}
