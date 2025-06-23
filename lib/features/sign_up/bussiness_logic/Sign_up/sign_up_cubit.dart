import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/features/sign_up/data/repository/sign_up_repository.dart';

import '../../../../core/error/error_func.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpCubit({required this.signUpRepository})
      : super(SignUpState(
          fullname: '',
          email: '',
          password: '',
          confirmPassword: '',
          mobilePhone: '',
          birthday: '',
          passcode: '',
          confirmPasscode: '',
          status: SignUpStatus.initial,
          errorMessage: null,
        ));

  void updateEmail(String email) {
    emit(state.copyWith(email: email, status: SignUpStatus.updating));
  }

  void updateName(String name) {
    emit(state.copyWith(name: name, status: SignUpStatus.updating));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password, status: SignUpStatus.updating));
  }

  void updatePhone(String phone) {
    emit(state.copyWith(phone: phone, status: SignUpStatus.updating));
  }

  void updateBirthDate(String date) {
    emit(state.copyWith(birthDate: date, status: SignUpStatus.updating));
  }

  void updateConfirmPassword(String confirmPassword) {
    emit(state.copyWith(
        confirmPassword: confirmPassword, status: SignUpStatus.updating));
  }

  void updatePasscode(String passcode) {
    emit(state.copyWith(passcode: passcode, status: SignUpStatus.updating));
  }

  void updateConfirmPasscode(String confirmPasscode) {
    emit(state.copyWith(
        confirmPasscode: confirmPasscode, status: SignUpStatus.updating));
  }

  Future<void> submit() async {
    emit(state.copyWith(status: SignUpStatus.submitting));

    final result = await signUpRepository.signUp(
      fullname: state.fullname,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      mobilePhone: state.mobilePhone,
      birthday: state.birthday,
      passcode: state.passcode,
      confirmPasscode: state.confirmPasscode,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: SignUpStatus.failure,
        errorMessage: mapFailureToMessage(failure),
      )),
      (_) => emit(state.copyWith(status: SignUpStatus.success)),
    );
  }

  void updateProgress(double d) {}
}
