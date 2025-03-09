import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/custom_text_button.dart';
import '../../../../core/routhing/app_routes_name.dart';
import '../../../../core/theme/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/marketx.svg'),
            const SizedBox(height: 20),
            Image.asset('assets/images/cards.png'),
            const SizedBox(height: 20),
            Image.asset('assets/images/frame.png'),
            const SizedBox(height: 20),
            const Text(
              'خيارك الأول للاستثمار في عالم \n .سوق الأسهم بأمان تام',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                  color: AppColors.primaryGreen),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'معانا هتقدر تستثمر فلوسك وانت مطمن وفاهم زي \nالمحترفين وأكتر',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                  color: Colors.grey),
            ),
            const SizedBox(height: 40),
            CustomTextButton(
              onPressed: () {
                Get.toNamed(AppRoutesName.onBoarding);
              },
              text: 'خلينا نبدأ!',
            ),
          ],
        ),
      ),
    );
  }
}
