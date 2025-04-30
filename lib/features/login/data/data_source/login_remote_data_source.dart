import 'package:x_market/core/helper/auth_model.dart';

import '../../../../core/error/exceprtion.dart';
import '../../../../core/network/api_constant.dart';
import '../../../../core/network/api_services.dart';

class LoginRemoteDataSource {
  final ApiServices apiServices;
  LoginRemoteDataSource({required this.apiServices});

  Future<AuthModel> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await apiServices.postData(
      urll: ApiConstance.login,
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AuthModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
