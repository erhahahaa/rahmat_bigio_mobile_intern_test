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
  late LocationLocalDataSourceImpl locationLocalDataSourceImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    isarClient = sl<IsarClient>();
    locationLocalDataSourceImpl = LocationLocalDataSourceImpl(isarClient);
  });

  group('Cache locations', () {
    test(
      'SHOULD cache the locations WHEN the call is successful',
      () async {
        // Arrange
        final testLocationList = (json.decode(
          jsonReader('locations/all_location_raw.json'),
        )['results'] as List)
            .map((e) => LocationModel.fromJson(e))
            .toList();
        // Act
        final result =
            await locationLocalDataSourceImpl.cacheLocations(testLocationList);

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<LocationEntity>>()),
        );
      },
    );

    test(
      'SHOULD return a list of LocationModel WHEN the call is successful',
      () async {
        // Arrange
        final testLocationList = (json.decode(
          jsonReader('locations/all_location_raw.json'),
        )['results'] as List)
            .map((e) => LocationModel.fromJson(e))
            .toList();

        // Act
        final result =
            await locationLocalDataSourceImpl.getLocationsFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) {
            expect(r, isA<List<LocationEntity>>());
            expect(r, hasLength(testLocationList.length));
          },
        );
      },
    );

    test(
      'SHOULD return a CacheFailure WHEN the call is unsuccessful',
      () async {
        // Arrange
        await locationLocalDataSourceImpl.clearCache();

        // Act
        final result =
            await locationLocalDataSourceImpl.getLocationsFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<LocationEntity>>()),
        );
      },
    );

    test(
      'SHOULD clear the cache WHEN the call is successful',
      () async {
        // Arrange
        final testLocationList = (json.decode(
          jsonReader('locations/all_location_raw.json'),
        )['results'] as List)
            .map((e) => LocationModel.fromJson(e))
            .toList();
        await locationLocalDataSourceImpl.cacheLocations(testLocationList);

        // Act
        await locationLocalDataSourceImpl.clearCache();
        final result =
            await locationLocalDataSourceImpl.getLocationsFromCache();
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
        await locationLocalDataSourceImpl.clearCache();

        // Act
        final result = await locationLocalDataSourceImpl.clearCache();

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
      'SHOULD toggle the favorite location WHEN the call is successful',
      () async {
        // Arrange
        final testLocationList = (json.decode(
          jsonReader('locations/all_location_raw.json'),
        )['results'] as List)
            .map((e) => LocationModel.fromJson(e))
            .toList();
        await locationLocalDataSourceImpl.cacheLocations(testLocationList);

        // Act
        final result = await locationLocalDataSourceImpl.toggleFavoriteLocation(
          ByIdParam(id: testLocationList.first.id),
        );

        // Assert
        expect(true, result.isRight());
      },
    );

    test(
      'SHOULD return a CacheFailure WHEN the call is unsuccessful',
      () async {
        // Arrange
        await locationLocalDataSourceImpl.clearCache();

        // Act
        final result = await locationLocalDataSourceImpl.toggleFavoriteLocation(
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
