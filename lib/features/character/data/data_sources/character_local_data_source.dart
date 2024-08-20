import 'package:dartz/dartz.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class CharacterLocalDataSource {
  Future<Either<Failure, List<CharacterEntity>>> getCharactersFromCache();
  Future<Either<Failure, void>> toggleFavoriteCharacter(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}
