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
  late LocationRemoteDataSourceImpl dataSource;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    dataSource = LocationRemoteDataSourceImpl(dioClient);
  });

  group('Get Locations', () {
    test('SHOULD return a list of LocationModel WHEN the call is successful',
        () async {
      // Arrange
      final testLocationList = (json.decode(
        jsonReader('locations/all_location_raw.json'),
      )['results'] as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        ListAPI.LOCATION,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<LocationModel>>(testLocationList),
      );

      // Act
      final result = await dataSource.getLocations();

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<LocationModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        ListAPI.LOCATION,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, List<LocationModel>>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getLocations();

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<List<LocationModel>>()),
      );
    });
  });

  group('Get Location', () {
    test('SHOULD return a LocationModel WHEN the call is successful', () async {
      // Arrange
      final testLocation = LocationModel.fromJson(
        json.decode(jsonReader('locations/location_1.json')),
      );

      when(dioClient.getRequest(
        '${ListAPI.LOCATION}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, LocationModel>(testLocation),
      );

      // Act
      final result = await dataSource.getLocation(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<LocationModel>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.LOCATION}/1',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, LocationModel>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getLocation(const ByIdParam(id: 1));

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<LocationModel>()),
      );
    });
  });

  group('Get Multiple Locations', () {
    test('SHOULD return a list of LocationModel WHEN the call is successful',
        () async {
      // Arrange
      final testLocationList = (json.decode(
        jsonReader('locations/all_location_raw.json'),
      )['results'] as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        '${ListAPI.LOCATION}/1,2,3',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<LocationModel>>(testLocationList),
      );

      // Act
      final result = await dataSource.getMultipleLocations(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<LocationModel>>()),
      );
    });

    test('SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
      // Arrange
      when(dioClient.getRequest(
        '${ListAPI.LOCATION}/1,2,3',
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => const Left<Failure, List<LocationModel>>(ServerFailure()),
      );

      // Act
      final result = await dataSource.getMultipleLocations(
        const ByIdsParam(ids: [1, 2, 3]),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<ServerFailure>()),
        (r) => expect(r, isA<List<LocationModel>>()),
      );
    });
  });

  group('Get Filtered Locations', () {
    test('SHOULD return a list of LocationModel WHEN the call is successful',
        () async {
      // Arrange
      final testLocationList = (json.decode(
        jsonReader('locations/all_location_raw.json'),
      )['results'] as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();

      when(dioClient.getRequest(
        ListAPI.LOCATION,
        queryParameters: anyNamed('queryParameters'),
        converter: anyNamed('converter'),
        onReceiveProgress: anyNamed('onReceiveProgress'),
        cancelToken: anyNamed('cancelToken'),
      )).thenAnswer(
        (_) async => Right<Failure, List<LocationModel>>(testLocationList),
      );

      // Act
      final result = await dataSource.getFilteredLocations(
        const GetLocationsByFilterParams(name: 'Rick'),
      );

      // Assert
      result.fold(
        (l) => expect(l, isA<Failure>()),
        (r) => expect(r, isA<List<LocationModel>>()),
      );
    });
  });

  tearDownAll(() {
    sl.reset();
  });
}
