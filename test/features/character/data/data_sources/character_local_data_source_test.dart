import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hidayatullah/app/sl.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';

void main() {
  late IsarClient isarClient;
  late CharacterLocalDataSourceImpl characterLocalDataSourceImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    isarClient = sl<IsarClient>();
    characterLocalDataSourceImpl = CharacterLocalDataSourceImpl(isarClient);
  });

  group('Cache characters', () {
    test(
      'SHOULD cache the characters WHEN the call is successful',
      () async {
        // Arrange
        final testCharacterList = (json.decode(
          jsonReader('characters/all_character_raw.json'),
        )['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
        // Act
        final result = await characterLocalDataSourceImpl
            .cacheCharacters(testCharacterList);

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
      },
    );

    test(
      'SHOULD return a list of CharacterModel WHEN the call is successful',
      () async {
        // Arrange
        final testCharacterList = (json.decode(
          jsonReader('characters/all_character_raw.json'),
        )['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();

        // Act
        final result =
            await characterLocalDataSourceImpl.getCharactersFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) {
            expect(r, isA<List<CharacterEntity>>());
            expect(r, hasLength(testCharacterList.length));
          },
        );
      },
    );

    test(
      'SHOULD return a CacheFailure WHEN the call is unsuccessful',
      () async {
        // Arrange
        await characterLocalDataSourceImpl.clearCache();

        // Act
        final result =
            await characterLocalDataSourceImpl.getCharactersFromCache();

        // Assert
        result.fold(
          (l) => expect(l, isA<CacheFailure>()),
          (r) => expect(r, isA<List<CharacterEntity>>()),
        );
      },
    );

    test(
      'SHOULD clear the cache WHEN the call is successful',
      () async {
        // Arrange
        final testCharacterList = (json.decode(
          jsonReader('characters/all_character_raw.json'),
        )['results'] as List)
            .map((e) => CharacterModel.fromJson(e))
            .toList();
        await characterLocalDataSourceImpl.cacheCharacters(testCharacterList);

        // Act
        await characterLocalDataSourceImpl.clearCache();
        final result =
            await characterLocalDataSourceImpl.getCharactersFromCache();
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
        await characterLocalDataSourceImpl.clearCache();

        // Act
        final result = await characterLocalDataSourceImpl.clearCache();

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
        final result =
            await characterLocalDataSourceImpl.toggleFavoriteCharacter(
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
        final result =
            await characterLocalDataSourceImpl.toggleFavoriteCharacter(
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
