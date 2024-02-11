import 'package:dio/dio.dart';

class ReqException {
  static String handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out!';
      case DioExceptionType.receiveTimeout || DioExceptionType.sendTimeout:
        return 'Request timed out';
      case DioExceptionType.connectionTimeout ||
            DioExceptionType.connectionError:
        return 'You have no internet connection!';
      case DioExceptionType.badCertificate:
        return 'Bad Certificate';
      case DioExceptionType.badResponse:
        if (e.response?.data is String) {
          return e.response?.data ??
              'Something went wrong. Please try again later';
        } else {
          return e.response?.data?['message'] ??
              'Something went wrong. Please try again later';
        }
      default:
        return 'Something went wrong. Please try again later!';
    }
  }
}
