import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class CharacterLocalDataSource {
  Future<Either<Failure, CharacterEntity>> cacheCharacter(
    CharacterEntity character,
  );
  Future<Either<Failure, List<CharacterEntity>>> cacheCharacters(
    List<CharacterEntity> characters,
  );
  Future<Either<Failure, List<CharacterEntity>>> getCharactersFromCache();
  Future<Either<Failure, List<CharacterEntity>>> getFavoriteCharacters();
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByIds(
    ByIdsParam param,
  );
  Future<Either<Failure, CharacterEntity>> toggleFavoriteCharacter(
    ByIdParam param,
  );
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: CharacterLocalDataSource)
class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final IsarClient _isar;

  CharacterLocalDataSourceImpl(this._isar);

  @override
  Future<Either<Failure, CharacterEntity>> cacheCharacter(
    CharacterEntity character,
  ) async {
    final caching = await _isar.instance.writeTxn(() async {
      final id = await _isar.instance.characters.put(character);
      return await _isar.instance.characters.get(id);
    });

    if (caching == null) {
      return Left(
        CacheFailure(message: 'Failed to caching ${character.name}'),
      );
    }
    return Right(caching);
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> cacheCharacters(
    List<CharacterEntity> characters,
  ) async {
    final cachings = await _isar.instance.writeTxn(() async {
      final ids = await _isar.instance.characters.putAll(characters);
      return await _isar.instance.characters.getAll(ids);
    });
    if (cachings.isEmpty) {
      return const Left(
        CacheFailure(message: 'Failed to caching characters'),
      );
    }
    for (final character in cachings) {
      if (character == null) {
        return const Left(
          CacheFailure(message: 'Failed to caching character'),
        );
      }
    }
    return Right(characters);
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    await _isar.instance.writeTxn(() async {
      await _isar.instance.characters.clear();
    });
    final check = await _isar.instance.characters.count();
    if (check != 0) {
      return const Left(
          CacheFailure(message: 'Error clearing characters cache'));
    }
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>>
      getCharactersFromCache() async {
    final characters = await _isar.instance.characters.where().findAll();

    if (characters.isNotEmpty) {
      return Right(characters);
    } else {
      return const Left(CacheFailure(message: 'No characters in cache'));
    }
  }

  @override
  Future<Either<Failure, CharacterEntity>> toggleFavoriteCharacter(
      ByIdParam param) async {
    final character = await _isar.instance.characters.get(param.id);
    if (character == null) {
      return const Left(CacheFailure(message: 'Character not found in cache'));
    }
    return await cacheCharacter(
      CharacterModel.fromEntity(character)
          .copyWith(
            isFavorite: !character.isFavorite,
          )
          .toEntity(),
    );
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getFavoriteCharacters() async {
    final characters = await _isar.instance.characters
        .where()
        .filter()
        .isFavoriteEqualTo(true)
        .findAll();
    if (characters.isEmpty) {
      return const Left(
          CacheFailure(message: 'No favorite characters in cache'));
    }
    return Right(characters);
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharactersByIds(
    ByIdsParam param,
  ) async {
    final characters = await _isar.instance.characters.getAll(param.ids);
    if (characters.isEmpty) {
      return const Left(CacheFailure(message: 'No characters in cache'));
    }
    final temp = <CharacterEntity>[];
    for (final character in characters) {
      if (character == null) {
        return const Left(CacheFailure(message: 'Failed to get character'));
      } else {
        temp.add(character);
      }
    }

    return Right(temp);
  }
}
