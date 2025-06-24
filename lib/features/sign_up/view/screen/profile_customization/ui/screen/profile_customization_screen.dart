import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../../../../../bussiness_logic/progress_indecator.dart';

class ProfileCustomizationScreen extends StatelessWidget {
  const ProfileCustomizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),
                  const CustomHeadText(
                    text: ' هنفصل على مقاسك',
                  ),
                  const SizedBox(height: 20),
                  const CustomSubHeadText(
                    text:
                        'هنسألك 4 أسئلة بالظبط، بناء على اختياراتك هنفصلك تجربة استخدام للتطبيق مناسبة لأهدافك من الاستثمار.',
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/phone_customization.png',
                  ),
                ],
              ),
            ),
            BlocBuilder<ProgressIndicatorCubit, double>(
              builder: (context, progress) {
                return LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.secondaryGreen),
                );
              },
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  onPressed: () {},
                  text: '! مش دلوقتي ',
                  width: 150,
                  buttonColor: Colors.white,
                  textColor: AppColors.primaryGreen,
                ),
                const SizedBox(width: 16),
                CustomTextButton(
                  onPressed: () {
                    Get.toNamed(
                        AppRoutesName.profileCustomizationQuestionScreen);
                  },
                  text: '! يلا بينا',
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
