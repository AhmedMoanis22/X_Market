import 'package:flutter/material.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import '../widget/custom_onboarding_widget.dart';

class OnboradingScreen extends StatelessWidget {
  const OnboradingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(child: CustomOnboardingWidget()),
        ],
      ),
    );
  }
}
