import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/theme/colors.dart';

import '../../../../../core/helper/custom_text_button.dart';
import '../../../../../core/utilits/widgets/custom_appbar.dart';
import '../../../bussiness_logic/progress_indecator.dart';

class NationalIdScreen extends StatelessWidget {
  const NationalIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'إثبات الهوية الشخصية وبطاقة الرقم القومي',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'IBMPLEXSANSARABICBold',
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'محتاجين صورة البطاقة الشخصية عشان تثبت إنك عايش في مصر وعلشان نقدر نأكد هويتك. بياناتك بتتراجع بأمان.',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'IBMPLEXSANSARABICRegular',
                        color: AppColors.gray),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'صورة بطاقة الرقم القومي وش وضهر',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBMPLEXSANSARABICRegular',
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        'assets/icons/personalcard.svg',
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'صورة سيلفي للتحقق من الوجه',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBMPLEXSANSARABICRegular',
                          color: AppColors.primaryGreen,
                        ),
                      ),
                      const SizedBox(width: 20),
                      SvgPicture.asset(
                        'assets/icons/user-square.svg',
                        width: 50,
                        height: 50,
                      ),
                    ],
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
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CustomTextButton(
                onPressed: () {
                  Get.toNamed(AppRoutesName.sign_up_with_camera_national_id);
                  context.read<ProgressIndicatorCubit>().nextStep();
                },
                text: 'التالي',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
