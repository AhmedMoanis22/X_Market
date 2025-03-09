import 'package:get/get.dart';

import '../../features/onboarding/view/screen/onborading_screen.dart';
import '../../features/onboarding/view/screen/welcome_screen.dart';
import 'app_routes_name.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    page: () => const WelcomeScreen(),
    name: AppRoutesName.welcomeScreen,
  ),
  GetPage(name: AppRoutesName.onBoarding, page: () => const OnboradingScreen()),
];
