import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class CharacterRemoteDataSource {
  Future<Either<Failure, List<CharacterModel>>> getCharacters();
  Future<Either<Failure, CharacterModel>> getCharacter(
    ByIdParam param,
  );
  Future<Either<Failure, List<CharacterModel>>> getMultipleCharacters(
    ByIdsParam param,
  );
  Future<Either<Failure, List<CharacterModel>>> getFilteredCharacters(
    GetCharactersByFilterParams params,
  );
}
