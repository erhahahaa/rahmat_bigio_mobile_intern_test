import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class LocationRemoteDataSource {
  Future<Either<Failure, List<LocationModel>>> getLocations();
  Future<Either<Failure, LocationModel>> getLocation(
    ByIdParam param,
  );
  Future<Either<Failure, List<LocationModel>>> getMultipleLocations(
    ByIdsParam param,
  );
  Future<Either<Failure, List<LocationModel>>> getFilteredLocations(
    GetLocationsByFilterParams params,
  );
}

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final DioClient _dio;

  LocationRemoteDataSourceImpl(this._dio);

  @override
  Future<Either<Failure, LocationModel>> getLocation(
    ByIdParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.LOCATION}/${param.id}',
        converter: (json) => LocationModel.fromJson(json),
      );

  @override
  Future<Either<Failure, List<LocationModel>>> getLocations() =>
      _dio.getRequest(
        ListAPI.LOCATION,
        converter: (json) => json['results']
            .map(
              (e) => LocationModel.fromJson(e),
            )
            .toList(),
      );

  @override
  Future<Either<Failure, List<LocationModel>>> getFilteredLocations(
    GetLocationsByFilterParams params,
  ) =>
      _dio.getRequest(
        ListAPI.LOCATION,
        queryParameters: params.toJson(),
        converter: (json) => json['results']
            .map(
              (e) => LocationModel.fromJson(e),
            )
            .toList(),
      );

  @override
  Future<Either<Failure, List<LocationModel>>> getMultipleLocations(
    ByIdsParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.LOCATION}/${param.ids.join(',')}',
        converter: (json) => json
            .map(
              (e) => LocationModel.fromJson(e),
            )
            .toList(),
      );
}
