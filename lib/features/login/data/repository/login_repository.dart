import 'package:dartz/dartz.dart';
import 'package:x_market/core/helper/auth_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_error.dart';
import '../data_source/login_remote_data_source.dart';

class LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepository(
      {required this.loginRemoteDataSource, required this.networkInfo});

  Future<Either<Failure, AuthModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final remoteData = await loginRemoteDataSource.userLogin(
        email: email,
        password: password,
      );

      return Right(remoteData);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
