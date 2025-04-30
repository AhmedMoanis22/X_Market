// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/login/bussiness_logic/login_cubit.dart';
import '../../features/login/data/data_source/login_remote_data_source.dart';
import '../../features/login/data/repository/login_repository.dart';
import '../../features/sign_up/bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../../features/sign_up/data/data_source/sign_up_remote_data_source.dart';
import '../../features/sign_up/data/repository/sign_up_repository.dart';
import '../network/api_factory.dart';
import '../network/api_services.dart';
import '../network/network_error.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

  /*login*/
  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(apiServices: getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      connectionChecker: InternetConnectionChecker.createInstance()));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(
        loginRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepository: getIt()));

  /*signup*/
  getIt.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSource(apiServices: getIt()));
  getIt.registerLazySingleton<SignUpRepository>(() => SignUpRepository(
        signUpRemoteDataSource: getIt(),
        networkInfo: getIt(),
      ));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(signUpRepository: getIt()));
}
