import 'package:dartz/dartz.dart';
import 'package:hidayatullah/core/core.dart';
import 'package:hidayatullah/features/features.dart';
import 'package:hidayatullah/utils/utils.dart';
import 'package:injectable/injectable.dart';

abstract class EpisodeRemoteDataSource {
  Future<Either<Failure, WithPagination<EpisodeModel>>> getEpisodes();
  Future<Either<Failure, WithPagination<EpisodeModel>>> getEpisodesByPagination(
    Pagination pagination,
  );
  Future<Either<Failure, EpisodeModel>> getEpisode(
    ByIdParam param,
  );
  Future<Either<Failure, List<EpisodeModel>>> getMultipleEpisodes(
    ByIdsParam param,
  );
  Future<Either<Failure, List<EpisodeModel>>> getFilteredEpisodes(
    GetEpisodesByFilterParams params,
  );
}

@LazySingleton(as: EpisodeRemoteDataSource)
class EpisodeRemoteDataSourceImpl implements EpisodeRemoteDataSource {
  final DioClient _dio;

  EpisodeRemoteDataSourceImpl(this._dio);

  @override
  Future<Either<Failure, EpisodeModel>> getEpisode(
    ByIdParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.EPISODE}/${param.id}',
        converter: (json) => EpisodeModel.fromJson(json),
      );

  @override
  Future<Either<Failure, WithPagination<EpisodeModel>>> getEpisodes() =>
      _dio.getRequest(
        ListAPI.EPISODE,
        converter: (json) => WithPagination.fromJson(
          json,
          (json) => EpisodeModel.fromJson(json),
        ),
      );

  @override
  Future<Either<Failure, List<EpisodeModel>>> getFilteredEpisodes(
    GetEpisodesByFilterParams params,
  ) =>
      _dio.getRequest(
        ListAPI.EPISODE,
        queryParameters: params.toJson(),
        converter: (json) {
          final List<EpisodeModel> episodes = [];
          for (final item in json['results']) {
            episodes.add(EpisodeModel.fromJson(item));
          }
          return episodes;
        },
      );

  @override
  Future<Either<Failure, List<EpisodeModel>>> getMultipleEpisodes(
    ByIdsParam param,
  ) =>
      _dio.getRequest(
        '${ListAPI.EPISODE}/${param.ids.join(',')}',
        converter: (json) => json
            .map(
              (e) => EpisodeModel.fromJson(e),
            )
            .toList(),
      );

  @override
  Future<Either<Failure, WithPagination<EpisodeModel>>> getEpisodesByPagination(
    Pagination pagination,
  ) =>
      _dio.getRequest(
        ListAPI.EPISODE,
        queryParameters: {
          'page': pagination.pages,
        },
        converter: (json) => WithPagination.fromJson(
          json,
          (json) => EpisodeModel.fromJson(json),
        ),
      );
}
