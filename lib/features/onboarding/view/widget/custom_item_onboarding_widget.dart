import 'package:flutter/material.dart';
import 'package:x_market/features/onboarding/data/model/onboarding_model.dart';

import '../../../../core/theme/colors.dart';

class CustomItemOnboardingWidget extends StatelessWidget {
  const CustomItemOnboardingWidget({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            width: 250,
            height: 250,
            onboardingModel.image,
          ),
          const SizedBox(height: 80),
          Text(
            onboardingModel.title,
            style: const TextStyle(
              fontSize: 24,
              fontFamily: 'IBMPLEXSANSARABICBold',
              color: AppColors.primaryGreen,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Text(
            onboardingModel.description,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: 'IBMPLEXSANSARABICBold',
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
