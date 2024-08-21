import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class GetEpisodesByPagination
    extends FPUC<WithPagination<EpisodeEntity>, Pagination> {
  final EpisodeRepository _repository;

  GetEpisodesByPagination(this._repository);

  @override
  Future<Either<Failure, WithPagination<EpisodeEntity>>> call(
    Pagination params,
  ) {
    return _repository.getEpisodesByPagination(params);
  }
}
