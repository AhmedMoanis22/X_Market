import 'package:get/get.dart';
import 'package:x_market/features/home_screen.dart';
import 'package:x_market/features/sign_up/view/screen/Sign_up_with_country/sign_up_with_country.dart';
import 'package:x_market/features/sign_up/view/screen/Sign_up_with_national_id/camera_national_id_screen.dart';
import 'package:x_market/features/sign_up/view/screen/pin_code/confirm_pincode_screen.dart';
import 'package:x_market/features/sign_up/view/screen/pin_code/create_pincode_screen.dart';

import '../../features/login/view/screen/login_screen.dart';
import '../../features/onboarding/view/screen/onborading_screen.dart';
import '../../features/onboarding/view/screen/welcome_screen.dart';
import '../../features/sign_up/view/screen/Sign_up_with_email/sign_up_with_email.dart';
import '../../features/sign_up/view/screen/Sign_up_with_names/sign_up_with_names.dart';
import '../../features/sign_up/view/screen/Sign_up_with_national_id/national_id_screen.dart';
import '../../features/sign_up/view/screen/create_passowrd/create_password_screen.dart';
import '../../features/sign_up/view/screen/finish_steps_screen.dart';
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
      name: AppRoutesName.create_pincode_screen,
      page: () => const CreatePincodeScreen()),
  GetPage(
      name: AppRoutesName.confirm_pincode_screen,
      page: () => const ConfirmPincodeScreen()),
  GetPage(name: AppRoutesName.home, page: () => const HomeScreen()),
  GetPage(
    name: AppRoutesName.creaet_password,
    page: () => CreatePasswordScreen(),
  ),
  GetPage(
    name: AppRoutesName.sign_up_with_national_id,
    page: () => const NationalIdScreen(),
  ),
  GetPage(
    name: AppRoutesName.sign_up_with_camera_national_id,
    page: () => const NationalIdCameraScreen(),
  ),
  GetPage(
    name: AppRoutesName.finish_little_steps,
    page: () => const FinishStepsScreen(),
  ),
];
