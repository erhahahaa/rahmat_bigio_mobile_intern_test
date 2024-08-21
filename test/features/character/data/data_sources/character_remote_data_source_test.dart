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
  late DioClient dioClient;
  late CharacterRemoteDataSourceImpl dataSource;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    dataSource = CharacterRemoteDataSourceImpl(dioClient);
  });

  group('Get Characters', () {
    test('SHOULD return a list of CharacterModel WHEN the call is successful',
        () async {
      // Arrange
      final jsonMap = json.decode(
        jsonReader('characters/all_character_raw.json'),
      );
      final testCharacterList = WithPagination.fromJson(
        jsonMap,
        (jsonMap) => CharacterModel.fromJson(jsonMap),
      );

      when(dioClient.getRequest(
        ListAPI.CHARACTER,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async =>
            Right<Failure, WithPagination<CharacterModel>>(testCharacterList),
      );

      // Act
      final result = await dataSource.getCharacters();

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<WithPagination<CharacterModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        ListAPI.CHARACTER,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, WithPagination<CharacterModel>>(
            ServerFailure()),
      );

      // Act
      final result = await dataSource.getCharacters();

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<WithPagination<CharacterModel>>()),
      );
    });
  });

  group('Get Character', () {
    test('SHOULD return a CharacterModel WHEN the call is successful',
        () async {
      // Arrange
      final testCharacter = CharacterModel.fromJson(
        json.decode(jsonReader('characters/character_1.json')),
      );

      when(dioClient.getRequest(
        '${ListAPI.CHARACTER}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, CharacterModel>(testCharacter),
      );

      // Act
      final result = await dataSource.getCharacter(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<CharacterModel>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.CHARACTER}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, CharacterModel>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getCharacter(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<CharacterModel>()),
      );
    });
  });

  group('Get Multiple Characters', () {
    test('SHOULD return a list of CharacterModel WHEN the call is successful',
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
        (_) async => Right<Failure, List<CharacterModel>>(testCharacterList),
      );

      // Act
      final result = await dataSource.getMultipleCharacters(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<CharacterModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.CHARACTER}/1,2,3',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, List<CharacterModel>>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getMultipleCharacters(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<List<CharacterModel>>()),
      );
    });
  });

  group('Get Filtered Characters', () {
    test('SHOULD return a list of CharacterModel WHEN the call is successful',
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
        (_) async => Right<Failure, List<CharacterModel>>(testCharacterList),
      );

      // Act
      final result = await dataSource.getFilteredCharacters(
        const GetCharactersByFilterParams(
          name: 'Rick',
          status: CharacterStatus.alive,
        ),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<CharacterModel>>()),
      );
    });
  });

  tearDownAll(() {
    sl.reset();
  });
}
