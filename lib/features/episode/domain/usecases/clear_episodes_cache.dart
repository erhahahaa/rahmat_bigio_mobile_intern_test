import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ClearEpisodesCache extends FNPUC<void> {
  final EpisodeRepository repository;

  ClearEpisodesCache(this.repository);

  @override
  Future<Either<Failure, void>> call() => repository.clearCache();
}
