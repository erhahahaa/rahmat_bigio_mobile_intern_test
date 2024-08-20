import 'package:dio/dio.dart';

class HttpCallback {
  ProgressCallback? onReceiveProgress;
  ProgressCallback? onSendProgress;
  CancelToken? cancelToken;

  HttpCallback({
    this.onReceiveProgress,
    this.onSendProgress,
    this.cancelToken,
  });
}
