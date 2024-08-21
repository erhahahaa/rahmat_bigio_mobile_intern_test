import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/helpers/helpers.dart';

@lazySingleton
class GetEpisodes extends FNPUC<WithPagination<EpisodeEntity>> {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  @override
  Future<Either<Failure, WithPagination<EpisodeEntity>>> call() =>
      repository.getEpisodes();
}
