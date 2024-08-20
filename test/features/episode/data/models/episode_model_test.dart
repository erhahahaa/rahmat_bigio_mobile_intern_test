// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rick_morty/features/features.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testEpisodeModel = EpisodeModel(
    id: 1,
    name: 'Pilot',
    airDate: 'December 2, 2013',
    episode: 'S01E01',
    characters: ['https://rickandmortyapi.com/api/character/1'],
    url: 'https://rickandmortyapi.com/api/episode/1',
    created: DateTime.parse('2017-11-10T12:56:33.798Z'),
  );
  group('EpisodeModel', () {
    test('SHOULD be a subclass of Episode entity', () {
      // Arrange
      print('Arrange');
      // Act
      print('Act');
      // Assert
      print('Assert');
      expect(testEpisodeModel, isA<EpisodeEntity>());
      print('PASS');
    });

    group('fromJson', () {
      test('SHOULD return a valid model WHEN the JSON is valid', () {
        // Arrange
        print('Arrange');
        final Map<String, dynamic> jsonMap =
            json.decode(jsonReader('episodes/episode_1.json'));
        print('jsonMap: $jsonMap');

        // Act
        print('Act');
        final result = EpisodeModel.fromJson(jsonMap);
        print('result: $result');

        // Assert
        print('Assert');
        expect(result, testEpisodeModel);
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
          () => EpisodeModel.fromJson(
            json.decode(jsonReader('episodes/invalid_episode_1.json')),
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
        final result = testEpisodeModel.toJson();
        final expectedMap = {
          "id": 1,
          "name": "Pilot",
          "air_date": "December 2, 2013",
          "episode": "S01E01",
          "characters": ['https://rickandmortyapi.com/api/character/1'],
          "url": "https://rickandmortyapi.com/api/episode/1",
          "created": "2017-11-10T12:56:33.798Z",
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
