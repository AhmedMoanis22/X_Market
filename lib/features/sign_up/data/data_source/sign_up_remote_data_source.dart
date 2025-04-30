import 'package:x_market/core/helper/auth_model.dart';

import '../../../../core/error/exceprtion.dart';
import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';

class SignUpRemoteDataSource {
  final ApiServices apiServices;
  SignUpRemoteDataSource({required this.apiServices});

  Future<AuthModel> signup({
    required String fullname,
    required String email,
    required String password,
    required String confirmPassword,
    required String mobilePhone,
    required String birthday,
    required String passcode,
    required String confirmPasscode,
  }) async {
    final response = await apiServices.postData(
      urll: ApiConstance.signup,
      data: {
        'fullname': fullname,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
        'mobile': mobilePhone,
        'birthday': birthday,
        'passcode': passcode,
        'confirm_passcode': confirmPasscode,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AuthModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
