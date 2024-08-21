// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty/features/features.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testCharacterModel = CharacterModel(
    id: 1,
    name: 'Rick Sanchez',
    status: CharacterStatus.alive,
    species: 'Human',
    type: '',
    gender: CharacterGender.male,
    origin: const CharacterOriginModel(
      name: 'Earth (C-137)',
      url: 'https://rickandmortyapi.com/api/location/1',
    ),
    location: const CharacterLocationModel(
      name: 'Citadel of Ricks',
      url: 'https://rickandmortyapi.com/api/location/3',
    ),
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    episode: ['https://rickandmortyapi.com/api/episode/1'],
    url: 'https://rickandmortyapi.com/api/character/1',
    created: DateTime.parse('2017-11-04T18:48:46.250Z'),
  );
  group('CharacterModel', () {
    test('SHOULD be a subclass of Character entity', () {
      // Arrange
      print('Arrange');
      // Act
      print('Act');
      // Assert
      print('Assert');
      expect(testCharacterModel, isA<CharacterEntity>());
      print('PASS');
    });

    group('fromJson', () {
      test('SHOULD return a valid model WHEN the JSON is valid', () {
        // Arrange
        print('Arrange');
        final Map<String, dynamic> jsonMap =
            json.decode(jsonReader('characters/character_1.json'));
        print('jsonMap: $jsonMap');

        // Act
        print('Act');
        final result = CharacterModel.fromJson(jsonMap);
        print('result: $result');

        // Assert
        print('Assert');
        expect(result, testCharacterModel);
        print('PASS');
      });

      test('SHOULD return a valid model WHEN the JSON is invalid', () {
        // Arrange
        print('Arrange');

        // Act
        print('Act');

        // Assert
        print('Assert');
        expect(
          () => CharacterModel.fromJson(
            json.decode(jsonReader('characters/invalid_character_1.json')),
          ),
          throwsA(isA<Exception>()),
        );
        print('PASS');
      });
    });

    group('toJson', () {
      test('SHOULD return a JSON map containing the proper data', () {
        // Arrange
        print('Arrange');
        final result = testCharacterModel.toJson();
        final expectedMap = {
          "id": 1,
          "name": "Rick Sanchez",
          "status": "Alive",
          "species": "Human",
          "type": "",
          "gender": "Male",
          "origin": {
            "name": "Earth (C-137)",
            "url": "https://rickandmortyapi.com/api/location/1"
          },
          "location": {
            "name": "Citadel of Ricks",
            "url": "https://rickandmortyapi.com/api/location/3"
          },
          "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
          "episode": ["https://rickandmortyapi.com/api/episode/1"],
          "url": "https://rickandmortyapi.com/api/character/1",
          "created": "2017-11-04T18:48:46.250Z"
        };
        print('result: $result');
        print('expectedMap: $expectedMap');

        // Act
        print('Act');

        // Assert
        print('Assert');
        expect(result, expectedMap);
        print('PASS');
      });
    });
  });
}
