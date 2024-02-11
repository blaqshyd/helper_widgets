// ignore_for_file: public_member_api_docs, sort_constructors_first
class Failure {
  final String? message;
  final StackTrace? stackTrace;
  const Failure({
    this.message,
    this.stackTrace,
  });
}

class Success {
  final String? message;
  final StackTrace? stackTrace;
  const Success({
    this.message,
    this.stackTrace,
  });
}

class AppResponse {
  final bool status;
  final String? message;
  AppResponse({
    required this.status,
    this.message,
  });
}
