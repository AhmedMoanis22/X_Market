import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../widget/investment_itme.dart';

class ProfileCustomizationChart extends StatelessWidget {
  const ProfileCustomizationChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.primaryYellow,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryYellow,
                  Colors.white,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  const CustomHeadText(
                    text: 'ده كان أداء الاستثمار ده في الخمس السنين اللي فاتت',
                  ),
                  SizedBox(height: 10.h),
                  const CustomSubHeadText(
                    text:
                        'لو استمثرت المبلغ ده بنسبة 70% في الدهب، 20% في الدخل الثابت، 10% في الأسهم.',
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const InvestmentItme(
                          amount: '680,100 ج.م',
                          label: 'قيمة المحفظة\nخلال 5 سنوات',
                        ),
                        _buildDivider(),
                        const InvestmentItme(
                            amount: '300,000 ج.م',
                            label: 'إجمالي الاستثمارات\nخلال 5 سنوات'),
                        _buildDivider(),
                        const InvestmentItme(
                            amount: '5000 ج.م', label: 'استثمار شهري'),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Image.asset(
                      'assets/images/chart.png',
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const CustomSubHeadText(
                      text:
                          'العوائد القديمة دي مش شرط تضمن العوائد المستقبلية'),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutesName.bottomNavBarScreen);
                      },
                      text: 'التالي'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40.h,
      width: 1,
      color: Colors.grey.shade300,
    );
  }
}
