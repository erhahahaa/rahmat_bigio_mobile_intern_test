import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

abstract class LocationRemoteDataSource {
  Future<Either<Failure, WithPagination<LocationModel>>> getLocations();
  Future<Either<Failure, WithPagination<LocationModel>>>
      getLocationsByPagination(
    Pagination pagination,
  );
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
  Future<Either<Failure, WithPagination<LocationModel>>> getLocations() =>
      _dio.getRequest(
        ListAPI.LOCATION,
        converter: (json) => WithPagination.fromJson(
          json,
          (json) => LocationModel.fromJson(json),
        ),
      );

  @override
  Future<Either<Failure, List<LocationModel>>> getFilteredLocations(
    GetLocationsByFilterParams params,
  ) =>
      _dio.getRequest(
        ListAPI.LOCATION,
        queryParameters: params.toJson(),
        converter: (json) {
          final List<LocationModel> locations = [];
          for (final item in json['results']) {
            locations.add(LocationModel.fromJson(item));
          }
          return locations;
        },
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

  @override
  Future<Either<Failure, WithPagination<LocationModel>>>
      getLocationsByPagination(
    Pagination pagination,
  ) =>
          _dio.getRequest(
            ListAPI.LOCATION,
            queryParameters: {
              'page': pagination.pages,
            },
            converter: (json) => WithPagination.fromJson(
              json,
              (json) => LocationModel.fromJson(json),
            ),
          );
}
