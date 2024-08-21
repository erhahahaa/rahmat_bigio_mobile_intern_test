import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

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
