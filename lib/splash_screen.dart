import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'features/onboarding/view/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.asset("assets/lottie/splash_logo.json"),
          )
        ],
      ),
      splashTransition: SplashTransition.rotationTransition,
      nextScreen: const WelcomeScreen(),
      backgroundColor: const Color(0xFF003D31),
      splashIconSize: 400,
      centered: true,
      duration: 19000,
    );
  }
}
