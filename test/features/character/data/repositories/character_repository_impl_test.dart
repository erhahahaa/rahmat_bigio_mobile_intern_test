import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:rick_morty/app/sl.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

import '../../../../core/services/dio.mocks.dart';
import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  late MockDioClient dioClient;
  late IsarClient isarClient;
  late CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl;
  late CharacterLocalDataSourceImpl characterLocalDataSourceImpl;
  late CharacterRepositoryImpl characterRepositoryImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    isarClient = sl<IsarClient>();
    characterRemoteDataSourceImpl = CharacterRemoteDataSourceImpl(dioClient);
    characterLocalDataSourceImpl = CharacterLocalDataSourceImpl(isarClient);
    characterRepositoryImpl = CharacterRepositoryImpl(
      characterLocalDataSourceImpl,
      characterRemoteDataSourceImpl,
    );
  });

  group(
    'Get Characters',
    () {
      test(
        'SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();

          when(dioClient.getRequest(
            ListAPI.CHARACTER,
            queryParameters: anyNamed('queryParameters'),
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async =>
                Right<Failure, List<CharacterModel>>(testCharacterList),
          );

          // Act
          final result = await characterRepositoryImpl.getCharacters();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await characterRepositoryImpl.getCharacters();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Character',
    () {
      test(
        'SHOULD return a CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacter = CharacterModel.fromJson(
            json.decode(
              jsonReader('characters/character_1.json'),
            ),
          );

          when(dioClient.getRequest(
            '${ListAPI.CHARACTER}/1',
            queryParameters: anyNamed('queryParameters'),
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async => Right<Failure, CharacterModel>(testCharacter),
          );

          // Act
          final result = await characterRepositoryImpl.getCharacter(
            ByIdParam(id: testCharacter.id),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<CharacterEntity>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await characterRepositoryImpl.getCharacter(
            const ByIdParam(id: 1),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<CharacterEntity>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Toggle Favorite',
    () {
      test(
        'SHOULD toggle the favorite character WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
          await characterLocalDataSourceImpl.cacheCharacters(testCharacterList);

          // Act
          final result = await characterRepositoryImpl.toggleFavoriteCharacter(
            ByIdParam(id: testCharacterList.first.id),
          );

          // Assert
          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await characterRepositoryImpl.toggleFavoriteCharacter(
            const ByIdParam(id: 100),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Search Characters',
    () {
      test(
        'SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();

          when(dioClient.getRequest(
            ListAPI.CHARACTER,
            queryParameters: anyNamed('queryParameters'),
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async =>
                Right<Failure, List<CharacterModel>>(testCharacterList),
          );

          // Act
          final result = await characterRepositoryImpl.getFilteredCharacters(
            const GetCharactersByFilterParams(name: 'Rick'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await characterRepositoryImpl.getFilteredCharacters(
            const GetCharactersByFilterParams(name: 'Rick who does not exist'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Multiple Characters',
    () {
      test(
        'SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();

          when(dioClient.getRequest(
            '${ListAPI.CHARACTER}/1,2,3',
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async =>
                Right<Failure, List<CharacterModel>>(testCharacterList),
          );

          // Act
          final result = await characterRepositoryImpl.getMultipleCharacters(
            const ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await characterRepositoryImpl.getMultipleCharacters(
            const ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Characters',
    () {
      test(
        'SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
          await characterLocalDataSourceImpl.cacheCharacters(testCharacterList);

          // Act
          await characterRepositoryImpl.toggleFavoriteCharacter(
            ByIdParam(id: testCharacterList.first.id),
          );
          final result = await characterRepositoryImpl.getFavoriteCharacters();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await characterLocalDataSourceImpl.clearCache();

          // Act
          final result = await characterRepositoryImpl.getFavoriteCharacters();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Toggle Favorite',
    () {
      test(
        'SHOULD toggle the favorite character WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
          await characterLocalDataSourceImpl.cacheCharacters(testCharacterList);

          // Act
          final result = await characterRepositoryImpl.toggleFavoriteCharacter(
            ByIdParam(id: testCharacterList.first.id),
          );

          // Assert
          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await characterLocalDataSourceImpl.clearCache();

          // Act
          final result = await characterRepositoryImpl.toggleFavoriteCharacter(
            const ByIdParam(id: 1),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Characters',
    () {
      test(
        'SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
          // Arrange
          final testCharacterList = (json.decode(
            jsonReader('characters/all_character_raw.json'),
          )['results'] as List)
              .map((e) => CharacterModel.fromJson(e))
              .toList();
          await characterLocalDataSourceImpl.cacheCharacters(testCharacterList);

          // Act
          await characterRepositoryImpl.toggleFavoriteCharacter(
            ByIdParam(id: testCharacterList.first.id),
          );
          final result = await characterRepositoryImpl.getFavoriteCharacters();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await characterLocalDataSourceImpl.clearCache();

          // Act
          final result = await characterRepositoryImpl.getFavoriteCharacters();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<CharacterEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  tearDownAll(() {
    sl.reset();
  });
}
