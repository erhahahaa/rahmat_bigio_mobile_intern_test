import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class CharacterRemoteDataSource {
  Future<Either<Failure, WithPagination<CharacterModel>>> getCharacters();
  Future<Either<Failure, WithPagination<CharacterModel>>>
      getCharactersByPagination(
    Pagination pagination,
  );
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

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final DioClient _dio;

  CharacterRemoteDataSourceImpl(this._dio);

  @override
  Future<Either<Failure, CharacterModel>> getCharacter(
    ByIdParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.CHARACTER}/${param.id}',
        converter: (json) => CharacterModel.fromJson(json),
      );

  @override
  Future<Either<Failure, WithPagination<CharacterModel>>> getCharacters() =>
      _dio.getRequest(
        ListAPI.CHARACTER,
        converter: (json) => WithPagination.fromJson(
          json,
          (json) => CharacterModel.fromJson(json),
        ),
      );

  @override
  Future<Either<Failure, List<CharacterModel>>> getFilteredCharacters(
    GetCharactersByFilterParams params,
  ) =>
      _dio.getRequest(
        ListAPI.CHARACTER,
        queryParameters: params.toJson(),
        converter: (json) {
          final List<CharacterModel> characters = [];
          for (final item in json['results']) {
            characters.add(CharacterModel.fromJson(item));
          }
          return characters;
        },
      );

  @override
  Future<Either<Failure, List<CharacterModel>>> getMultipleCharacters(
    ByIdsParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.CHARACTER}/${param.ids.join(',')}',
        converter: (json) => json
            .map(
              (e) => CharacterModel.fromJson(e),
            )
            .toList(),
      );

  @override
  Future<Either<Failure, WithPagination<CharacterModel>>>
      getCharactersByPagination(
    Pagination pagination,
  ) =>
          _dio.getRequest(
            ListAPI.CHARACTER,
            queryParameters: {
              'page': pagination.pages,
            },
            converter: (json) => WithPagination.fromJson(
              json,
              (json) => CharacterModel.fromJson(json),
            ),
          );
}
