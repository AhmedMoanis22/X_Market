import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/error_func.dart';
import '../data/repository/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  void usrtLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginRepository.userLogin(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(LoginFailure(mapFailureToMessage(failure))),
      (data) => emit(LoginSuccess(data)),
    );
  }
}
