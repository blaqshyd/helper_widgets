sealed class AuthState {}

class InitialState extends AuthState {}

class LoadingState extends AuthState {}

class DataState extends AuthState {}

class ErrorState extends AuthState {}
