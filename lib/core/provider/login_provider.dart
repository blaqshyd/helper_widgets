import 'package:helper/core/extensions/log_extension.dart';
import 'package:helper/core/index.dart';

class LoginProvider extends BaseProvider<AuthState> {
  LoginProvider() : super(InitialState());

  FutureVoid login() async {
    emit(LoadingState());
    try {
      final res = await null;
      emit(DataState());
      return res;
    } catch (e) {
      e.log();
      emit(ErrorState());
    }
  }
}
