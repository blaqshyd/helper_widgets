// import 'package:dio/dio.dart';

// @Riverpod(keepAlive: true)
// Dio agathaHttpClient(AgathaHttpClientRef ref)
// {
//   final regularHttpClient = ref.watch(regularHttpClientProvider);
//   final userAuth = ref.watch(authControllerProvider.notifier);

//   final agathaHttpClient = Dio(BaseOptions(
//     baseUrl: Constants.apiBaseUrl
//   ));

//   agathaHttpClient.interceptors.addAll({
//     AgathaAuthenticationInterceptor(agathaHttpClient, userAuth, regularHttpClient),
//   });

//   return agathaHttpClient;
// }

// class AgathaAuthenticationInterceptor extends QueuedInterceptorsWrapper
// {
//   final AuthController userAuth;
//   final Dio agathaHttpClient;
//   final Dio regularHttpClient;

//   AgathaAuthenticationInterceptor(this.agathaHttpClient, this.userAuth, this.regularHttpClient);

//   @override Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async
//   {
//     // To enable authentication on a request we add the authorization header with the value 'BEARER'
//     if (options.headers.containsKey('Authorization'))
//     {
//       final accessToken = userAuth.getAccessToken();
//       if (accessToken != null)
//       {
//         options.headers['Authorization'] = 'BEARER $accessToken';
//       }
//       else
//       {
//         options.headers.remove('Authorization');
//       }
//     }

//     super.onRequest(options, handler);
//   }

//   @override Future<void> onError(DioException err, ErrorInterceptorHandler handler) async
//   {
//     if (err.response?.statusCode == 401 || err.response?.statusCode == 403)
//     {
//       logger.i('Authorization error when calling `${err.requestOptions.uri}`. Tokens might be expired.');
//       logger.i('Authorization header: ${err.requestOptions.headers['Authorization']}');

//       try
//       {
//         final options = err.response!.requestOptions;

//         await userAuth.refreshTokens();

//         try
//         {
//           final response = await _retry(options, userAuth.getAccessToken()!);
//           return handler.resolve(response);
//         }
//         on DioException catch (e)
//         {
//           if (e.response?.statusCode == 401 || e.response?.statusCode == 403)
//           {
//             logger.e('Request still failed authorization after tokens were succesfully refreshed.');
//             userAuth.logout();
//           }
//           else
//           {
//             logger.e('Request retry with error ${e.response?.statusCode} after tokens were succesfully refreshed.');
//           }
//           return super.onError(e, handler);
//         }
//       }
//       catch (e)
//       {
//         logger.e('Refreshing tokens failed with error $e.');
//       }
//     }

//     logger.e('Agatha request failed with error ${err.response?.statusCode}.');

//     return super.onError(err, handler);
//   }

//   Future<Response<dynamic>> _retry(RequestOptions options, String newAccessToken)
//   {
//     final requestOptions = options.copyWith();
//     requestOptions.headers['Authorization'] = 'BEARER $newAccessToken';

//     return regularHttpClient.request<dynamic>(
//       requestOptions.baseUrl + requestOptions.path,
//       cancelToken: requestOptions.cancelToken,
//       data: requestOptions.data,
//       onReceiveProgress: requestOptions.onReceiveProgress,
//       onSendProgress: requestOptions.onSendProgress,
//       queryParameters: requestOptions.queryParameters,
//       options: Options(
//         method: requestOptions.method,
//         sendTimeout: requestOptions.sendTimeout,
//         receiveTimeout: requestOptions.receiveTimeout,
//         extra: requestOptions.extra,
//         headers: requestOptions.headers,
//         responseType: requestOptions.responseType,
//         contentType: requestOptions.contentType,
//         validateStatus: requestOptions.validateStatus,
//         receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
//         followRedirects: requestOptions.followRedirects,
//         maxRedirects: requestOptions.maxRedirects,
//         requestEncoder: requestOptions.requestEncoder,
//         responseDecoder: requestOptions.responseDecoder,
//         listFormat: requestOptions.listFormat,
//       ),
//     );
//   }
// }
