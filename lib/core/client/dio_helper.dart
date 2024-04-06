import 'package:dio/dio.dart';
import 'package:helper/shared/shared.dart';

class DioHelper {
  late Dio _dio;

  DioHelper() {
    // static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppAssets.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(microseconds: 50000),
        receiveTimeout: const Duration(microseconds: 50000),
      ),
    );

    _dio.interceptors.addAll(
      [
        LogInterceptor(requestBody: true, responseBody: true),
        InterceptorsWrapper(),
      ],
    );
    // }
  }

  Dio get dio => _dio;

  Future<Response> postReqHandler({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> getReqHandler({
    required String path,
    Map<String, dynamic>? query,
    String? token,
    String? lang,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      path,
      queryParameters: query,
    );
  }

  Future<Response> updateReqHandler({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.put(
      path,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> deleteReqHandler({
    required String path,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'lang': 'en',
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.delete(path);
  }

  Future<Response<dynamic>> _retry(
    RequestOptions options,
    String newAccessToken,
  ) {
    final requestOptions = options.copyWith();
    requestOptions.headers['Authorization'] = 'BEARER $newAccessToken';

    return dio.request<dynamic>(
      requestOptions.baseUrl + requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        headers: requestOptions.headers,
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        followRedirects: requestOptions.followRedirects,
        maxRedirects: requestOptions.maxRedirects,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        listFormat: requestOptions.listFormat,
      ),
    );
  }
}
