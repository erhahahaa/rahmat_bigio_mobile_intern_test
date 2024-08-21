import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/errors/failure.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/params/by_id_param.dart';
import 'package:rick_morty/utils/params/by_ids_param.dart';

@LazySingleton(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterLocalDataSource _local;
  final CharacterRemoteDataSource _remote;

  CharacterRepositoryImpl(this._local, this._remote);

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      return await _local.clearCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacter(ByIdParam param) async {
    try {
      final result = await _remote.getCharacter(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entity = r.toEntity();
          await _local.cacheCharacter(entity);
          return Right(entity);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final result = await _remote.getCharacters();
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheCharacters(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>>
      getCharactersFromCache() async {
    try {
      return await _local.getCharactersFromCache();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getFilteredCharacters(
      GetCharactersByFilterParams params) async {
    try {
      final result = await _remote.getFilteredCharacters(params);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheCharacters(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getMultipleCharacters(
      ByIdsParam param) async {
    try {
      final result = await _remote.getMultipleCharacters(param);
      return result.fold(
        (l) => Left(l),
        (r) async {
          final entities = r.map((e) => e.toEntity()).toList();
          await _local.cacheCharacters(entities);
          return Right(entities);
        },
      );
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleFavoriteCharacter(ByIdParam param) async {
    try {
      return await _local.toggleFavoriteCharacter(param);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> getFavoriteCharacters() async {
    try {
      return await _local.getFavoriteCharacters();
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
