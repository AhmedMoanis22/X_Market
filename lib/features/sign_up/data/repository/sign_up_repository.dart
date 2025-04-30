import 'package:dartz/dartz.dart';
import 'package:x_market/core/helper/auth_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_error.dart';
import '../data_source/sign_up_remote_data_source.dart';

class SignUpRepository {
  final SignUpRemoteDataSource signUpRemoteDataSource;
  final NetworkInfo networkInfo;

  SignUpRepository(
      {required this.signUpRemoteDataSource, required this.networkInfo});

  Future<Either<Failure, AuthModel>> signUp({
    required String fullname,
    required String email,
    required String password,
    required String confirmPassword,
    required String mobilePhone,
    required String birthday,
    required String passcode,
    required String confirmPasscode,
  }) async {
    try {
      final remoteData = await signUpRemoteDataSource.signup(
        fullname: fullname,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        mobilePhone: mobilePhone,
        birthday: birthday,
        passcode: passcode,
        confirmPasscode: confirmPasscode,
      );

      return Right(remoteData);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
