import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

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
