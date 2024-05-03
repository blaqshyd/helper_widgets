import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// final _apiClient = AppInitializer.locator<ApiClient>();

class RetryInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest

    //   String? token;

    //   if (token!.isNotEmpty) {
    //     _apiClient.setToken(token);
    //   } else {
    //     _apiClient.removeToken();
    //   }
    //   return handler.next(options);
  }

  @override

  /// Handles the response from the API.
  ///
  /// This function takes in a [response] object and a [handler] object as parameters.
  /// The [response] object represents the response received from the API.
  /// The [handler] object is used to handle the response.
  ///
  /// This function does not return anything.
  ///
  /// The purpose of this function is to implement the logic for handling the response from the API.
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log the request method and URL
    debugPrint('Request Method: ${response.requestOptions.method}');
    debugPrint('Request URL: ${response.requestOptions.uri}');

    // Log the response status code and data
    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Data: ${response.data}');

    // Pass the response to the next handler
    handler.next(response);
  }
}







  // Future<Response<dynamic>> _retry(
  //   RequestOptions options,
  //   String newAccessToken,
  // ) {
  //   final requestOptions = options.copyWith();
  //   requestOptions.headers['Authorization'] = 'BEARER $newAccessToken';

  //   return dio.request<dynamic>(
  //     requestOptions.baseUrl + requestOptions.path,
  //     cancelToken: requestOptions.cancelToken,
  //     data: requestOptions.data,
  //     onReceiveProgress: requestOptions.onReceiveProgress,
  //     onSendProgress: requestOptions.onSendProgress,
  //     queryParameters: requestOptions.queryParameters,
  //     options: Options(
  //       method: requestOptions.method,
  //       sendTimeout: requestOptions.sendTimeout,
  //       receiveTimeout: requestOptions.receiveTimeout,
  //       extra: requestOptions.extra,
  //       headers: requestOptions.headers,
  //       responseType: requestOptions.responseType,
  //       contentType: requestOptions.contentType,
  //       validateStatus: requestOptions.validateStatus,
  //       receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
  //       followRedirects: requestOptions.followRedirects,
  //       maxRedirects: requestOptions.maxRedirects,
  //       requestEncoder: requestOptions.requestEncoder,
  //       responseDecoder: requestOptions.responseDecoder,
  //       listFormat: requestOptions.listFormat,
  //     ),
  //   );
  // }
