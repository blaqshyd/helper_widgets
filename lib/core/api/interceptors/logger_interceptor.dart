import 'dart:developer';

import 'package:dio/dio.dart';

class LoggerInterceptor implements Interceptor {
  final stopwatches = <String, Stopwatch>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = '${options.baseUrl}${options.path}';
    stopwatches[url] = Stopwatch()..start();
    log('🌍 Making request: $url');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final resReqOptions = response.requestOptions;
    final url = '${resReqOptions.baseUrl}${resReqOptions.path}';
    _logMessageAndClearStopwatch(statusCode, url, '⬅️ Received response');
    if (resReqOptions.queryParameters.isNotEmpty) {
      log('Query params: ${resReqOptions.queryParameters}');
    }
    log('${response.statusMessage} || SUCCESS REQUEST|| ${resReqOptions.responseType}');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final url = err.requestOptions.uri.toString();
    final statusCode = err.response?.statusCode;
    _logMessageAndClearStopwatch(statusCode, url, '❌ Received error');
    // log('${err.stackTrace}');
    // log('Message: ${err.message}');

    if (err.response?.data != null) {
      log('❌ | Response Error: ${err.response?.data}');
    }
    return handler.next(err);
  }

  void _logMessageAndClearStopwatch(
    int? statusCode,
    String url,
    String message,
  ) {
    final stopwatch = stopwatches[url];
    if (stopwatch != null) {
      stopwatch.stop();
      _logResponse(statusCode, stopwatch.elapsedMilliseconds, url);
      stopwatches.remove(url);
    } else {
      log(message);
    }
  }

  void _logResponse(int? statusCode, int milliseconds, String url) {
    final emoji = switch (statusCode) {
      != null && >= 200 && < 300 => '✅',
      != null && >= 300 && < 400 => '🟠',
      _ => '❌'
    };
    if (statusCode != null) {
      log('$emoji $statusCode $emoji | ${milliseconds}ms | $url');
    } else {
      log('$emoji | ${milliseconds}ms | $url');
    }
  }
}
