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
  late EpisodeRemoteDataSourceImpl dataSource;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    dataSource = EpisodeRemoteDataSourceImpl(dioClient);
  });

  group('Get Episodes', () {
    test('SHOULD return a list of EpisodeModel WHEN the call is successful',
        () async {
      // Arrange
      final testEpisodeList = (json.decode(
        jsonReader('episodes/all_episode_raw.json'),
      )['results'] as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        ListAPI.EPISODE,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<EpisodeModel>>(testEpisodeList),
      );

      // Act
      final result = await dataSource.getEpisodes();

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<EpisodeModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        ListAPI.EPISODE,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, List<EpisodeModel>>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getEpisodes();

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<List<EpisodeModel>>()),
      );
    });
  });

  group('Get Episode', () {
    test('SHOULD return a EpisodeModel WHEN the call is successful', () async {
      // Arrange
      final testEpisode = EpisodeModel.fromJson(
        json.decode(jsonReader('episodes/episode_1.json')),
      );

      when(dioClient.getRequest(
        '${ListAPI.EPISODE}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, EpisodeModel>(testEpisode),
      );

      // Act
      final result = await dataSource.getEpisode(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<EpisodeModel>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.EPISODE}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, EpisodeModel>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getEpisode(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<EpisodeModel>()),
      );
    });
  });

  group('Get Multiple Episodes', () {
    test('SHOULD return a list of EpisodeModel WHEN the call is successful',
        () async {
      // Arrange
      final testEpisodeList = (json.decode(
        jsonReader('episodes/all_episode_raw.json'),
      )['results'] as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        '${ListAPI.EPISODE}/1,2,3',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<EpisodeModel>>(testEpisodeList),
      );

      // Act
      final result = await dataSource.getMultipleEpisodes(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<EpisodeModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.EPISODE}/1,2,3',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, List<EpisodeModel>>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getMultipleEpisodes(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<List<EpisodeModel>>()),
      );
    });
  });

  group('Get Filtered Episodes', () {
    test('SHOULD return a list of EpisodeModel WHEN the call is successful',
        () async {
      // Arrange
      final testEpisodeList = (json.decode(
        jsonReader('episodes/all_episode_raw.json'),
      )['results'] as List)
          .map((e) => EpisodeModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        ListAPI.EPISODE,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<EpisodeModel>>(testEpisodeList),
      );

      // Act
      final result = await dataSource.getFilteredEpisodes(
        const GetEpisodesByFilterParams(
          name: 'Rick',
        ),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<EpisodeModel>>()),
      );
    });
  });

  tearDownAll(() {
    sl.reset();
  });
}
