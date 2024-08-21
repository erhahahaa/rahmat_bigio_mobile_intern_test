// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hidayatullah/features/features.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testLocationModel = LocationModel(
    id: 1,
    name: 'Earth (C-137)',
    type: 'Planet',
    dimension: 'Dimension C-137',
    residents: ['https://rickandmortyapi.com/api/character/38'],
    url: 'https://rickandmortyapi.com/api/location/1',
    created: DateTime.parse('2017-11-10T12:42:04.162Z'),
  );
  group('LocationModel', () {
    test('SHOULD be a subclass of Location entity', () {
      // Arrange
      print('Arrange');
      // Act
      print('Act');
      // Assert
      print('Assert');
      expect(testLocationModel, isA<LocationEntity>());
      print('PASS');
    });

    group('fromJson', () {
      test('SHOULD return a valid model WHEN the JSON is valid', () {
        // Arrange
        print('Arrange');
        final Map<String, dynamic> jsonMap =
            json.decode(jsonReader('locations/location_1.json'));
        print('jsonMap: $jsonMap');

        // Act
        print('Act');
        final result = LocationModel.fromJson(jsonMap);
        print('result: $result');

        // Assert
        print('Assert');
        expect(result, testLocationModel);
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
          () => LocationModel.fromJson(
            json.decode(jsonReader('locations/invalid_location_1.json')),
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
        final result = testLocationModel.toJson();
        final expectedMap = {
          "id": 1,
          "name": "Earth (C-137)",
          "type": "Planet",
          "dimension": "Dimension C-137",
          "residents": ['https://rickandmortyapi.com/api/character/38'],
          "url": "https://rickandmortyapi.com/api/location/1",
          "created": "2017-11-10T12:42:04.162Z",
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
