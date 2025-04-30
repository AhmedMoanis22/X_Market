import 'package:get/get.dart';
import 'package:x_market/features/home_screen.dart';
import 'package:x_market/features/sign_up/view/screen/confirm_password_screen.dart';
import 'package:x_market/features/sign_up/view/screen/create_password_screen.dart';
import 'package:x_market/features/sign_up/view/screen/sign_up_with_country.dart';

import '../../features/login/view/screen/login_screen.dart';
import '../../features/onboarding/view/screen/onborading_screen.dart';
import '../../features/onboarding/view/screen/welcome_screen.dart';
import '../../features/sign_up/view/screen/sign_up_with_email.dart';
import '../../features/sign_up/view/screen/sign_up_with_names.dart';
import 'app_routes_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoutesName.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(name: AppRoutesName.onBoarding, page: () => const OnboradingScreen()),
  GetPage(name: AppRoutesName.login_in, page: () => const LoginScreen()),
  GetPage(name: AppRoutesName.sign_up_with_email, page: () => SignUpScreen()),
  GetPage(
      name: AppRoutesName.sign_up_with_names, page: () => SignUpWithNames()),
  GetPage(
      name: AppRoutesName.sign_up_with_country,
      page: () => const CountrySelectionScreen()),
  GetPage(
      name: AppRoutesName.create_password_screen,
      page: () => const CreatePasswordScreen()),
  GetPage(
      name: AppRoutesName.confirm_password_screen,
      page: () => const ConfirmPasswordScreen()),
  GetPage(name: AppRoutesName.home, page: () => const HomeScreen()),
];
