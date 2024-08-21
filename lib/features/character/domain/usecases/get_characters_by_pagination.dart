import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharactersByPagination
    extends FPUC<WithPagination<CharacterEntity>, Pagination> {
  final CharacterRepository _repository;

  GetCharactersByPagination(this._repository);

  @override
  Future<Either<Failure, WithPagination<CharacterEntity>>> call(
    Pagination params,
  ) {
    return _repository.getCharactersByPagination(params);
  }
}
