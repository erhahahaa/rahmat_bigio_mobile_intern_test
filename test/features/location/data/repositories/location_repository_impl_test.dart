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
  late LocationRemoteDataSourceImpl locationRemoteDataSourceImpl;
  late LocationLocalDataSourceImpl locationLocalDataSourceImpl;
  late LocationRepositoryImpl locationRepositoryImpl;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProvider();
    await configureDependencies(isUnitTest: true);
  });

  setUp(() {
    dioClient = MockDioClient();
    isarClient = sl<IsarClient>();
    locationRemoteDataSourceImpl = LocationRemoteDataSourceImpl(dioClient);
    locationLocalDataSourceImpl = LocationLocalDataSourceImpl(isarClient);
    locationRepositoryImpl = LocationRepositoryImpl(
      locationLocalDataSourceImpl,
      locationRemoteDataSourceImpl,
    );
  });

  group(
    'Get Locations',
    () {
      test(
        'SHOULD return a list of LocationModel WHEN the call is successful',
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
          final result = await locationRepositoryImpl.getLocations();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await locationRepositoryImpl.getLocations();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Location',
    () {
      test(
        'SHOULD return a LocationModel WHEN the call is successful',
        () async {
          // Arrange
          final testLocation = LocationModel.fromJson(
            json.decode(
              jsonReader('locations/location_1.json'),
            ),
          );

          when(dioClient.getRequest(
            '${ListAPI.LOCATION}/1',
            queryParameters: anyNamed('queryParameters'),
            converter: anyNamed('converter'),
            onReceiveProgress: anyNamed('onReceiveProgress'),
            cancelToken: anyNamed('cancelToken'),
          )).thenAnswer(
            (_) async => Right<Failure, LocationModel>(testLocation),
          );

          // Act
          final result = await locationRepositoryImpl.getLocation(
            ByIdParam(id: testLocation.id),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<LocationEntity>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await locationRepositoryImpl.getLocation(
            ByIdParam(id: 1),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<LocationEntity>()),
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
          final result = await locationRepositoryImpl.toggleFavoriteLocation(
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

          // Act
          final result = await locationRepositoryImpl.toggleFavoriteLocation(
            ByIdParam(id: 100),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Search Locations',
    () {
      test(
        'SHOULD return a list of LocationModel WHEN the call is successful',
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
          final result = await locationRepositoryImpl.getFilteredLocations(
            GetLocationsByFilterParams(name: 'Rick'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await locationRepositoryImpl.getFilteredLocations(
            GetLocationsByFilterParams(name: 'Rick who does not exist'),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Multiple Locations',
    () {
      test(
        'SHOULD return a list of LocationModel WHEN the call is successful',
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
          final result = await locationRepositoryImpl.getMultipleLocations(
            ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a ServerFailure WHEN the call is unsuccessful',
        () async {
          // Arrange

          // Act
          final result = await locationRepositoryImpl.getMultipleLocations(
            ByIdsParam(ids: [1, 2, 3]),
          );

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Locations',
    () {
      test(
        'SHOULD return a list of LocationModel WHEN the call is successful',
        () async {
          // Arrange
          final testLocationList = (json.decode(
            jsonReader('locations/all_location_raw.json'),
          )['results'] as List)
              .map((e) => LocationModel.fromJson(e))
              .toList();
          await locationLocalDataSourceImpl.cacheLocations(testLocationList);

          // Act
          await locationRepositoryImpl.toggleFavoriteLocation(
            ByIdParam(id: testLocationList.first.id),
          );
          final result = await locationRepositoryImpl.getFavoriteLocations();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await locationLocalDataSourceImpl.clearCache();

          // Act
          final result = await locationRepositoryImpl.getFavoriteLocations();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
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
          final result = await locationRepositoryImpl.toggleFavoriteLocation(
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
          final result = await locationRepositoryImpl.toggleFavoriteLocation(
            ByIdParam(id: 1),
          );

          // Assert
          expect(true, result.isLeft());
        },
      );
    },
  );

  group(
    'Get Favorite Locations',
    () {
      test(
        'SHOULD return a list of LocationModel WHEN the call is successful',
        () async {
          // Arrange
          final testLocationList = (json.decode(
            jsonReader('locations/all_location_raw.json'),
          )['results'] as List)
              .map((e) => LocationModel.fromJson(e))
              .toList();
          await locationLocalDataSourceImpl.cacheLocations(testLocationList);

          // Act
          await locationRepositoryImpl.toggleFavoriteLocation(
            ByIdParam(id: testLocationList.first.id),
          );
          final result = await locationRepositoryImpl.getFavoriteLocations();
          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
          );

          expect(true, result.isRight());
        },
      );

      test(
        'SHOULD return a CacheFailure WHEN the call is unsuccessful',
        () async {
          // Arrange
          await locationLocalDataSourceImpl.clearCache();

          // Act
          final result = await locationRepositoryImpl.getFavoriteLocations();

          // Assert
          result.fold(
            (l) => expect(l, isA<Failure>()),
            (r) => expect(r, isA<List<LocationEntity>>()),
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
