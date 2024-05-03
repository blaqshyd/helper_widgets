import 'package:dio/dio.dart';
import '../index.dart';

class DioApiClient implements ApiClient {
  late Dio _dio;

  Dio get dio => _dio;

  DioApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://google.com/',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        contentType: 'application/json',
      ),
    );

    // Logger.log('Dio', 'Initiated DioClient');
    dio.interceptors.addAll([
      LoggerInterceptor(),
      LogInterceptor(),
      RetryInterceptor(),
    ]);
  }

  @override
  void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  void removeToken() {
    dio.options.headers.remove('Authorization');
  }

  @override
  Future<ApiResponse<T>> request<T>(
    String path, {
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? fromJson,
  }) async {
    try {
      Response response;
      switch (method) {
        case MethodType.get:
          response = await _dio.get(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.post:
          response = await dio.post(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.put:
          response = await dio.put(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.delete:
          response = await _dio.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.patch:
          response = await dio.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
      }

      final resBody = response.data as Map<String, dynamic>;

      final cond = resBody.containsKey('data') ? resBody['data'] : resBody;
      return ApiResponse<T>(
        data: fromJson != null ? fromJson(cond) : null,
        isSuccess: true,
      );
    } on DioException catch (e) {
      if (e.response?.data != null) {
        return ApiResponse.error(
          error: e.response?.data['error'] ?? 'An Error occurred',
          message: e.response?.data['message'] ?? 'An Error occurred',
          statusCode: e.response?.data['statusCode'] ?? 0,
        );
      } else {
        return ApiResponse.error(
          error: e.response?.data ?? 'Something went wrong',
          message: e.response?.statusMessage ?? 'Something went wrong',
          statusCode: e.response?.statusCode ?? 0,
        );
      }
    }
  }
}



/*
      return ApiResponse<T>(
        data: fromJson != null
            ? fromJson(resBody.containsKey('data') ? resBody['data'] : resBody)
            : null,
        isSuccess: true,
      );
*/
