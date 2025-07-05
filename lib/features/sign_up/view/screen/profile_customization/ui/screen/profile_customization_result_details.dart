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

class ProfileCustomizationResultDetails extends StatelessWidget {
  const ProfileCustomizationResultDetails({super.key});

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
                  const CustomHeadText(text: 'الاستثمارات المقترحة لك'),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutesName.editInvestmentCurrency);
                        },
                        child: Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryblue,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'تعديل المبلغ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(
                                  'assets/icons/edit.svg',
                                  color: Colors.white,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'عايز أستثــــــــمر \n 5000 جنيه',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        const Text(
                          'صناديق الذهب',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBMPLEXSANSARABICBold',
                          ),
                        ),
                      ],
                    ),
                    const InvestmentCard(
                      percentage: 0.7,
                      title: 'BSB \n صندوق بلتون سبائك ',
                      pngiconPath: 'assets/images/belton.png',
                      color: Colors.blue,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                      textColor: AppColors.gray,
                      investedAmount: 'استثمر 5000 ج.م',
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        const Text(
                          'صناديق الدخل الثابت',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBMPLEXSANSARABICBold',
                          ),
                        ),
                      ],
                    ),
                    const InvestmentCard(
                      percentage: 0.2,
                      title: 'ABR \n صندوق بريق',
                      pngiconPath: 'assets/images/brik.png',
                      color: Colors.orange,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                      textColor: AppColors.gray,
                      investedAmount: 'استثمر 3000 ج.م',
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 8.w),
                        const Text(
                          'صناديق الأسهم',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'IBMPLEXSANSARABICBold',
                          ),
                        ),
                      ],
                    ),
                    const InvestmentCard(
                      percentage: 0.1,
                      title: 'BTC \n صندوق بلتون مية مية ',
                      pngiconPath: 'assets/images/belton.png',
                      color: Colors.green,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                      textColor: AppColors.gray,
                      investedAmount: 'استثمر 2000 ج.م',
                    ),
                  ],
                  SizedBox(height: 20.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(
                          AppRoutesName.profileCustomizationScreen,
                        );
                      },
                      text: 'إعادة التقييم',
                      width: 150,
                      buttonColor: Colors.white,
                      textColor: AppColors.primaryGreen,
                    ),
                    const SizedBox(width: 16),
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(
                          AppRoutesName.editInvestmentCurrency,
                        );
                      },
                      text: 'التالي',
                      width: 150,
                    ),
                  ]),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
