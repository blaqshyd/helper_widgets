import 'package:dio/dio.dart';
import 'package:helper/common/common.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppAssets.baseUrl,
        receiveDataWhenStatusError: true,
        //connectTimeout: 30 * 1000,
        //receiveTimeout: 30 * 1000,
      ),
    );

    // dio.interceptors.add(LogInterceptor(
    //     request: true,
    //     requestBody: true,
    //     responseBody: true,
    //     error: true,
    //     requestHeader: false,
    //     responseHeader: false,
    //     ));
  }

  static Future<Response> postReqHandler({
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

  static Future<Response> getReqHandler({
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

  static Future<Response> updateReqHandler({
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

  static Future<Response> deleteReqHandler({
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
}
