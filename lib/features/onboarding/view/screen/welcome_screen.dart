import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/custom_text_button.dart';
import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/theme/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                'assets/svg/marketx.svg',
                width: MediaQuery.of(context).size.width * 0.6,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  'assets/images/cards.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  'assets/images/frame.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'خيارك الأول للاستثمار في عالم \n .سوق الأسهم بأمان تام',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                    color: AppColors.primaryGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'معانا هتقدر تستثمر فلوسك وانت مطمن وفاهم زي \nالمحترفين وأكتر',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomTextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutesName.onBoarding);
                  },
                  text: 'خلينا نبدأ!',
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
