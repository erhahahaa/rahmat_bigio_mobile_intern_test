import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/utils/utils.dart';

@lazySingleton
class DioService with Log {
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ListAPI.BASE_URL,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      validateStatus: (int? status) => status != null && status > 0,
    ),
  );

  DioService() {
    _dio.interceptors.add(DioInterceptor());
  }

  @disposeMethod
  void dispose() {
    _dio.close();
  }

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    JSONIsolateConverter<T>? converter,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
      );

      if (response.statusCode == null ||
          response.statusCode! < 200 ||
          response.statusCode! > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (converter == null) {
        return Right(response.data as T);
      } else {
        final isolateParse = JSONIsolateParser<T>(
          response.data as Map<String, dynamic>,
          converter,
        );
        final result = await isolateParse.parseInBackground();
        return Right(result);
      }
    } on DioException catch (e, stackTrace) {
      return handleException(e, stackTrace);
    }
  }

  FutureOr<Either<Failure, T>> handleException<T>(
    DioException e,
    StackTrace stackTrace,
  ) {
    Log.failure("Dio Exception: ${e.toString()}");

    if (e.type == DioExceptionType.connectionTimeout) {
      return const Left(ServerFailure(message: 'Connection Timeout'));
    }

    final response = e.response;
    if (response == null) {
      Log.error(e.toString());
      Log.trace(stackTrace.toString());
      return const Left(ServerFailure(message: 'An error occurred'));
    }

    return Left(ServerFailure(
      message: _extractErrorMessage(response.data),
    ));
  }

  String _extractErrorMessage(dynamic error) {
    if (error is String) {
      return error;
    }
    if (error is Map<String, dynamic>) {
      final message = error['error'];
      if (message is String) return message;
      if (message is List) return _extractErrorMessage(message);
      if (message is Map<String, dynamic>) return _extractErrorMessage(message);
    }
    if (error is List && error.isNotEmpty) {
      return _extractErrorMessage(error.first);
    }
    return 'An error occurred';
  }
}
