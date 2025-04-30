enum SignUpStatus { initial, updating, submitting, success, failure }

class SignUpState {
  final String fullname;
  final String email;
  final String password;
  final String confirmPassword;
  final String mobilePhone;
  final String birthday;
  final String passcode;
  final String confirmPasscode;
  final SignUpStatus status;
  final String? errorMessage;

  SignUpState({
    this.fullname = '',
    this.email = '',
    this.confirmPassword = '',
    this.password = '',
    this.mobilePhone = '',
    this.birthday = '',
    this.passcode = '',
    this.confirmPasscode = '',
    this.status = SignUpStatus.initial,
    this.errorMessage,
  });

  SignUpState copyWith({
    String? email,
    String? name,
    String? password,
    String? confirmPassword,
    String? phone,
    String? birthDate,
    String? confirmPasscode,
    String? passcode,
    SignUpStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      fullname: name ?? fullname,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      mobilePhone: phone ?? mobilePhone,
      birthday: birthDate ?? birthday,
      passcode: passcode ?? this.passcode,
      confirmPasscode: confirmPasscode ?? this.confirmPasscode,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
