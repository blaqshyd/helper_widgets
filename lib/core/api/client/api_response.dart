class ApiResponse<T> {
  final String? message;
  final String? error;
  final String? status;
  final int? statusCode;
  final T? data;
  final bool isSuccess;

  ApiResponse({
    this.message,
    this.error,
    this.status,
    this.statusCode,
    this.data,
    this.isSuccess = true,
  });

  @override
  String toString() {
    return 'ApiResponse<$T>\nmessage: $message\ndata: $data\nstatusCode: $statusCode\nisSuccess: $isSuccess\nerror: $error\n';
  }

  factory ApiResponse.error({String? message, String? error, int? statusCode}) {
    return ApiResponse<T>(
      message: message ?? 'Something went wrong',
      error: error ?? 'An error occured',
      statusCode: statusCode ?? 0,
      isSuccess: false,
    );
  }
}
