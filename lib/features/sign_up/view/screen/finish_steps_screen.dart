import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/theme/colors.dart';

import '../../../../core/helper/custom_text_button.dart';
import '../../bussiness_logic/progress_indecator.dart';

class FinishStepsScreen extends StatelessWidget {
  const FinishStepsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.asset(
              'assets/images/Little_more_steps.png',
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/check_icon.svg',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'انت دلوقتي عندك حساب على ماركت إكس',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                          color: AppColors.primaryGreen),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'فاضلك بس خطوات بسيطة عشان تبدأ في عالم الاستثمار، لو عايز تكمل دوس على (إكمال التسجيل)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'IBMPLEXSANSARABICRegular',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // روح للرئيسية
                      },
                      child: const Text(
                        'او روح على الصفحة الرئيسية ←',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    const Spacer(),
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
                    SizedBox(height: 5.h),
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutesName.sign_up_with_national_id);
                        context.read<ProgressIndicatorCubit>().nextStep();
                      },
                      text: 'إكمال التسجيل',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
