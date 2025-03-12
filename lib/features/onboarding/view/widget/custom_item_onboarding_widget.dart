import 'package:flutter/material.dart';
import 'package:x_market/features/onboarding/data/model/onboarding_model.dart';

import '../../../../core/theme/colors.dart';

class CustomItemOnboardingWidget extends StatelessWidget {
  const CustomItemOnboardingWidget({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1), // 10% of screen width
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            onboardingModel.image,
            width: screenWidth * 0.6, // 60% of screen width
            height: screenWidth * 0.6, // 60% of screen width
          ),
          SizedBox(height: screenHeight * 0.1), // 10% of screen height
          Text(
            onboardingModel.title,
            style: TextStyle(
              fontSize: screenWidth * 0.06, // 6% of screen width
              fontFamily: 'IBMPLEXSANSARABICBold',
              color: AppColors.primaryGreen,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.02), // 2% of screen height
          Text(
            onboardingModel.description,
            style: TextStyle(
              fontSize: screenWidth * 0.035, // 3.5% of screen width
              fontFamily: 'IBMPLEXSANSARABICBold',
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
