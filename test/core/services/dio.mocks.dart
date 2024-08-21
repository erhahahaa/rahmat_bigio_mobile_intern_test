// Mocks generated by Mockito 5.4.4 from annotations
// in rick_morty/test/core/services/dio.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rick_morty/core/core.dart' as _i4;
import 'package:rick_morty/utils/utils.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i4.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i3.Either<_i4.Failure, T>> getRequest<T>(
    String? url, {
    Map<String, dynamic>? queryParameters,
    _i6.JSONIsolateConverter<T>? converter,
    _i2.ProgressCallback? onReceiveProgress,
    _i2.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRequest,
          [url],
          {
            #queryParameters: queryParameters,
            #converter: converter,
            #onReceiveProgress: onReceiveProgress,
            #cancelToken: cancelToken,
          },
        ),
        returnValue: _i5.Future<_i3.Either<_i4.Failure, T>>.value(
            _FakeEither_1<_i4.Failure, T>(
          this,
          Invocation.method(
            #getRequest,
            [url],
            {
              #queryParameters: queryParameters,
              #converter: converter,
              #onReceiveProgress: onReceiveProgress,
              #cancelToken: cancelToken,
            },
          ),
        )),
      ) as _i5.Future<_i3.Either<_i4.Failure, T>>);

  @override
  _i5.FutureOr<_i3.Either<_i4.Failure, T>> handleException<T>(
    _i2.DioException? e,
    StackTrace? stackTrace,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #handleException,
          [
            e,
            stackTrace,
          ],
        ),
        returnValue: _i5.Future<_i3.Either<_i4.Failure, T>>.value(
            _FakeEither_1<_i4.Failure, T>(
          this,
          Invocation.method(
            #handleException,
            [
              e,
              stackTrace,
            ],
          ),
        )),
      ) as _i5.FutureOr<_i3.Either<_i4.Failure, T>>);
}
