import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:rick_morty/app/sl.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  late IsarClient isarClient;
  late EpisodeLocalDataSourceImpl episodeLocalDataSourceImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    isarClient = sl<IsarClient>();
    episodeLocalDataSourceImpl = EpisodeLocalDataSourceImpl(isarClient);
  });

  group('Cache episodes', () {
    test(
      'SHOULD cache the episodes WHEN the call is successful',
      () async {
        // Arrange
        final testEpisodeList = (json.decode(
          jsonReader('episodes/all_episode_raw.json'),
        )['results'] as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList();
        // Act
        final result =
            await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<EpisodeEntity>>()),
        );
      },
    );

    test(
      'SHOULD return a list of EpisodeModel WHEN the call is successful',
      () async {
        // Arrange
        final testEpisodeList = (json.decode(
          jsonReader('episodes/all_episode_raw.json'),
        )['results'] as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList();

        // Act
        final result = await episodeLocalDataSourceImpl.getEpisodesFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) {
            expect(r, isA<List<EpisodeEntity>>());
            expect(r, hasLength(testEpisodeList.length));
          },
        );
      },
    );

    test(
      'SHOULD return a CacheFailure WHEN the call is unsuccessful',
      () async {
        // Arrange
        await episodeLocalDataSourceImpl.clearCache();

        // Act
        final result = await episodeLocalDataSourceImpl.getEpisodesFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<EpisodeEntity>>()),
        );
      },
    );

    test(
      'SHOULD clear the cache WHEN the call is successful',
      () async {
        // Arrange
        final testEpisodeList = (json.decode(
          jsonReader('episodes/all_episode_raw.json'),
        )['results'] as List)
            .map((e) => EpisodeModel.fromJson(e))
            .toList();
        await episodeLocalDataSourceImpl.cacheEpisodes(testEpisodeList);

        // Act
        await episodeLocalDataSourceImpl.clearCache();
        final result = await episodeLocalDataSourceImpl.getEpisodesFromCache();
        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isEmpty),
        );
      },
    );

    test(
      'SHOULD return a CacheFailure WHEN the call is unsuccessful',
      () async {
        // Arrange
        await episodeLocalDataSourceImpl.clearCache();

        // Act
        final result = await episodeLocalDataSourceImpl.clearCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => isA<void>(),
        );
      },
    );
  });

  group('Toggle Favorite', () {
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
        final result = await episodeLocalDataSourceImpl.toggleFavoriteEpisode(
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
        final result = await episodeLocalDataSourceImpl.toggleFavoriteEpisode(
          const ByIdParam(id: 1),
        );

        // Assert
        expect(true, result.isLeft());
      },
    );
  });

  tearDownAll(() async {
    await sl.reset();
  });
}
