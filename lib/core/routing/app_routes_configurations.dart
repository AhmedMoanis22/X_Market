import 'package:get/get.dart';
import 'package:x_market/features/forget_password/ui/screen/password_repeat_screen.dart';
import 'package:x_market/features/forget_password/ui/screen/verify_password_screen.dart';
import 'package:x_market/features/home_screen.dart';
import 'package:x_market/features/sign_up/view/screen/Sign_up_with_country/sign_up_with_country.dart';
import 'package:x_market/features/sign_up/view/screen/Sign_up_with_national_id_and_face_recognation/camera_national_id_screen.dart';
import 'package:x_market/features/sign_up/view/screen/pin_code/confirm_pincode_screen.dart';
import 'package:x_market/features/sign_up/view/screen/pin_code/create_pincode_screen.dart';

import '../../features/forget_password/ui/screen/forgot_password_screen.dart';
import '../../features/login/view/screen/login_screen.dart';
import '../../features/onboarding/view/screen/onborading_screen.dart';
import '../../features/onboarding/view/screen/welcome_screen.dart';
import '../../features/sign_up/view/screen/Sign_up_with_email/sign_up_with_email.dart';
import '../../features/sign_up/view/screen/Sign_up_with_names/sign_up_with_names.dart';
import '../../features/sign_up/view/screen/Sign_up_with_national_id_and_face_recognation/camera_national_id_back_screen.dart';
import '../../features/sign_up/view/screen/Sign_up_with_national_id_and_face_recognation/face_recognation_screen.dart';
import '../../features/sign_up/view/screen/Sign_up_with_national_id_and_face_recognation/national_id_screen.dart';
import '../../features/sign_up/view/screen/create_passowrd/create_password_screen.dart';
import '../../features/sign_up/view/screen/finish_steps_screen.dart';
import '../../features/sign_up/view/screen/job_status/job_status_screen.dart';
import '../../features/sign_up/view/screen/profile_customization/ui/screen/profile_customization_questions.dart';
import '../../features/sign_up/view/screen/profile_customization/ui/screen/profile_customization_screen.dart';
import '../../features/sign_up/view/screen/terms_and_conditions/terms_and_conditions_screen.dart';
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
    name: AppRoutesName.sign_up_with_camera_national_id_back,
    page: () => const NationalIdBackCameraScreen(),
  ),
  GetPage(
    name: AppRoutesName.face_recognation_screen,
    page: () => const FaceRecognationScreen(),
  ),
  GetPage(
    name: AppRoutesName.finish_little_steps,
    page: () => const FinishStepsScreen(),
  ),
  GetPage(
    name: AppRoutesName.job_status_screen,
    page: () => const JobStatusScreen(),
  ),
  GetPage(
    name: AppRoutesName.terms_and_conditions_screen,
    page: () => const TermsAndConditionsScreen(),
  ),
  GetPage(
    name: AppRoutesName.forgotPasswordScreen,
    page: () => ForgotPasswordScreen(),
  ),
  GetPage(
    name: AppRoutesName.passwordRepeatScreen,
    page: () => const PasswordRepeatScreen(),
  ),
  GetPage(
    name: AppRoutesName.verifyPasswordScreen,
    page: () => const VerifyPasswordScreen(),
  ),
  GetPage(
    name: AppRoutesName.profileCustomizationScreen,
    page: () => const ProfileCustomizationScreen(),
  ),
  GetPage(
      name: AppRoutesName.profileCustomizationQuestionScreen,
      page: () => const ProfileCustomizationQuestions()),
];
