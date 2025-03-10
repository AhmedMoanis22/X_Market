import 'package:get/get.dart';
import '../../features/onboarding/view/screen/onborading_screen.dart';
import '../../features/onboarding/view/screen/welcome_screen.dart';
import '../../features/login/view/screen/login_screen.dart';
import 'app_routes_name.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoutesName.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: AppRoutesName.onBoarding,
    page: () => const OnboradingScreen()),
  GetPage(
    name: AppRoutesName.login_in,
    page: () => const LoginScreen()),
];
