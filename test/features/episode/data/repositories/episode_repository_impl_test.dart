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
  late EpisodeRemoteDataSourceImpl episodeRemoteDataSourceImpl;
  late EpisodeLocalDataSourceImpl episodeLocalDataSourceImpl;
  late EpisodeRepositoryImpl episodeRepositoryImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    isarClient = sl<IsarClient>();
    episodeRemoteDataSourceImpl = EpisodeRemoteDataSourceImpl(dioClient);
    episodeLocalDataSourceImpl = EpisodeLocalDataSourceImpl(isarClient);
    episodeRepositoryImpl = EpisodeRepositoryImpl(
      episodeLocalDataSourceImpl,
      episodeRemoteDataSourceImpl,
    );
  });

  group(
    'Get Episodes',
    () {
      test(
        'SHOULD return a list of EpisodeModel WHEN the call is successful',
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
          final result = await episodeRepositoryImpl.getEpisodes();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await episodeRepositoryImpl.getEpisodes();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Episode',
    () {
      test(
        'SHOULD return a EpisodeModel WHEN the call is successful',
        () async {
          // Arrange
          final testEpisode = EpisodeModel.fromJson(
            json.decode(
              jsonReader('episodes/episode_1.json'),
            ),
          );

          when(dioClient.getRequest(
            '${ListAPI.EPISODE}/1',
            queryParameters: anyNamed('queryParameters'),
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async => Right<Failure, EpisodeModel>(testEpisode),
          );

          // Act
          final result = await episodeRepositoryImpl.getEpisode(
            ByIdParam(id: testEpisode.id),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<EpisodeEntity>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await episodeRepositoryImpl.getEpisode(
            const ByIdParam(id: 1),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<EpisodeEntity>()),
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
        'SHOULD toggle the favorite episode WHEN the call is successful',
        () async {
          // Arrange
          final testEpisodeList = (json.decode(
            jsonReader('episodes/all_episode_raw.json'),
          )['results'] as List)
              .map((e) => EpisodeModel.fromJson(e))
              .toList();
          await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

          // Act
          final result = await episodeRepositoryImpl.toggleFavoriteEpisode(
            ByIdParam(id: testEpisodeList.first.id),
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
          final result = await episodeRepositoryImpl.toggleFavoriteEpisode(
            const ByIdParam(id: 100),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Search Episodes',
    () {
      test(
        'SHOULD return a list of EpisodeModel WHEN the call is successful',
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
          final result = await episodeRepositoryImpl.getFilteredEpisodes(
            const GetEpisodesByFilterParams(name: 'Rick'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await episodeRepositoryImpl.getFilteredEpisodes(
            const GetEpisodesByFilterParams(name: 'Rick who does not exist'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Multiple Episodes',
    () {
      test(
        'SHOULD return a list of EpisodeModel WHEN the call is successful',
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
          final result = await episodeRepositoryImpl.getMultipleEpisodes(
            const ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await episodeRepositoryImpl.getMultipleEpisodes(
            const ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Episodes',
    () {
      test(
        'SHOULD return a list of EpisodeModel WHEN the call is successful',
        () async {
          // Arrange
          final testEpisodeList = (json.decode(
            jsonReader('episodes/all_episode_raw.json'),
          )['results'] as List)
              .map((e) => EpisodeModel.fromJson(e))
              .toList();
          await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

          // Act
          await episodeRepositoryImpl.toggleFavoriteEpisode(
            ByIdParam(id: testEpisodeList.first.id),
          );
          final result = await episodeRepositoryImpl.getFavoriteEpisodes();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await episodeLocalDataSourceImpl.clearCache();

          // Act
          final result = await episodeRepositoryImpl.getFavoriteEpisodes();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
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
        'SHOULD toggle the favorite episode WHEN the call is successful',
        () async {
          // Arrange
          final testEpisodeList = (json.decode(
            jsonReader('episodes/all_episode_raw.json'),
          )['results'] as List)
              .map((e) => EpisodeModel.fromJson(e))
              .toList();
          await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

          // Act
          final result = await episodeRepositoryImpl.toggleFavoriteEpisode(
            ByIdParam(id: testEpisodeList.first.id),
          );

          // Assert
          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await episodeLocalDataSourceImpl.clearCache();

          // Act
          final result = await episodeRepositoryImpl.toggleFavoriteEpisode(
            const ByIdParam(id: 1),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Episodes',
    () {
      test(
        'SHOULD return a list of EpisodeModel WHEN the call is successful',
        () async {
          // Arrange
          final testEpisodeList = (json.decode(
            jsonReader('episodes/all_episode_raw.json'),
          )['results'] as List)
              .map((e) => EpisodeModel.fromJson(e))
              .toList();
          await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

          // Act
          await episodeRepositoryImpl.toggleFavoriteEpisode(
            ByIdParam(id: testEpisodeList.first.id),
          );
          final result = await episodeRepositoryImpl.getFavoriteEpisodes();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await episodeLocalDataSourceImpl.clearCache();

          // Act
          final result = await episodeRepositoryImpl.getFavoriteEpisodes();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<EpisodeEntity>>()),
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
