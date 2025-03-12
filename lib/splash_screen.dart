import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'features/onboarding/view/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LottieBuilder.asset("assets/lottie/splash_logo.json"),
          )
        ],
      ),
      animationDuration: const Duration(seconds: 2),
      backgroundColor: const Color(0xFF003D31),
      splashIconSize: screenWidth * 0.8, // Set splashIconSize to 80% of screen width
      centered: true,
      duration: 1500,
      nextScreen: const WelcomeScreen(),
    );
  }
}
