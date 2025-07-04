import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../../../core/routing/app_routes_name.dart';
import '../../../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../../../core/utilits/widgets/custom_text_button.dart';
import '../widget/investment_card_widget.dart';

class ProfileCustomizationResult extends StatelessWidget {
  const ProfileCustomizationResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 250,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  const CustomHeadText(text: 'نتيجتك'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/protect.svg',
                        height: 100.h,
                        width: 100.w,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'المحافظ',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'انت شخص بيحب يحافظ على فلوسه وعايز تأمن على المكسب بتاعك',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'IBMPLEXSANSARABICSRegular',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10.w),
                            const Text(
                              'غير التقسيم',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'IBMPLEXSANSARABICBold',
                              ),
                              textAlign: TextAlign.right,
                            ),
                            SizedBox(width: 5.w),
                            SvgPicture.asset(
                              'assets/icons/setting.svg',
                              height: 15.h,
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'التقسيم الاستثماري',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset(
                        'assets/icons/parts.svg',
                        height: 30.h,
                        width: 30.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ...[
                    const InvestmentCard(
                      percentage: 0.7,
                      title: 'صناديق الذهب',
                      svgiconPath: 'assets/icons/gold.svg',
                      color: Colors.blue,
                    ),
                    const InvestmentCard(
                      percentage: 0.2,
                      title: 'صناديق الدخل الثابت',
                      svgiconPath: 'assets/icons/fixed_income.svg',
                      color: Colors.orange,
                    ),
                    const InvestmentCard(
                      percentage: 0.1,
                      title: 'صناديق الأسهم',
                      svgiconPath: 'assets/icons/stocks.svg',
                      color: Colors.green,
                    ),
                  ],
                  CustomTextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesName
                          .profileCustomizationResultDetailsScreen);
                    },
                    text: 'التالي',
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
