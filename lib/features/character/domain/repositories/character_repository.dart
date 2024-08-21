import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';

abstract class CharacterRepository {
  Future<Either<Failure, WithPagination<CharacterEntity>>> getCharacters();
  Future<Either<Failure, WithPagination<CharacterEntity>>>
      getCharactersByPagination(
    Pagination pagination,
  );
  Future<Either<Failure, CharacterEntity>> getCharacter(
    ByIdParam param,
  );
  Future<Either<Failure, List<CharacterEntity>>> getMultipleCharacters(
    ByIdsParam param,
  );
  Future<Either<Failure, List<CharacterEntity>>> getFilteredCharacters(
    GetCharactersByFilterParams params,
  );

  Future<Either<Failure, List<CharacterEntity>>> getCharactersFromCache();
  Future<Either<Failure, List<CharacterEntity>>> getFavoriteCharacters();
  Future<Either<Failure, CharacterEntity>> toggleFavoriteCharacter(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
