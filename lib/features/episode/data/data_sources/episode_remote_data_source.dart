import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';
import 'package:rick_morty/utils/utils.dart';

abstract class EpisodeRemoteDataSource {
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes();
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
        converter: EpisodeModel.fromJson as EpisodeModel Function(dynamic),
      );

  @override
  Future<Either<Failure, List<EpisodeModel>>> getEpisodes() => _dio.getRequest(
        ListAPI.EPISODE,
        converter: (json) => json['results']
            .map(
              (e) => EpisodeModel.fromJson(e),
            )
            .toList(),
      );

  @override
  Future<Either<Failure, List<EpisodeModel>>> getFilteredEpisodes(
    GetEpisodesByFilterParams params,
  ) =>
      _dio.getRequest(
        ListAPI.EPISODE,
        queryParameters: params.toJson(),
        converter: (json) => json['results']
            .map(
              (e) => EpisodeModel.fromJson(e),
            )
            .toList(),
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
}
