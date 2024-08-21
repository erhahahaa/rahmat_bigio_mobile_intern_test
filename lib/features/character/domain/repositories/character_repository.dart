import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
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
