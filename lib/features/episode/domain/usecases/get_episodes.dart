import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/helpers/helpers.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetEpisodes extends FNPUC<WithPagination<EpisodeEntity>> {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, WithPagination<EpisodeEntity>>> call() =>
      repository.getEpisodes();
}
