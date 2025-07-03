import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';
import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../../../core/utilits/widgets/custom_sub_head_text.dart';

class ProfileCustomizationResultInvestment extends StatefulWidget {
  const ProfileCustomizationResultInvestment({super.key});

  @override
  State<ProfileCustomizationResultInvestment> createState() =>
      _ProfileCustomizationResultInvestmentState();
}

class _ProfileCustomizationResultInvestmentState
    extends State<ProfileCustomizationResultInvestment> {
  String amount = '0';
  bool isMonthly = false;
  String enteredPin = "";
  final int pinLength = 4;
  


  void _addDigit(String digit) {
    setState(() {
      if (amount == '0') {
        amount = digit;
      } else {
        amount += digit;
      }
    });
  }

  void _removeLastDigit() {
    setState(() {
      if (amount.length > 1) {
        amount = amount.substring(0, amount.length - 1);
      } else {
        amount = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                      text: 'عايز تستثمر كام؟',
                    ),
                    SizedBox(height: 10.h),
                    const CustomSubHeadText(
                      text:
                          'هنعمل محاكاة لأداء الاستثمار بتاعك، متقلقش دي مجرد محاكاة مش هتدفع حاجة',
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(
                          'ج.م',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$amount',
                          style: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6E6E6),
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Row(
                            children: [
                              // زر "مرة واحدة"
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMonthly = false;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: !isMonthly
                                        ? AppColors.primaryGreen
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  child: Text(
                                    'مرة واحدة',
                                    style: TextStyle(
                                        color: !isMonthly
                                            ? Colors.white
                                            : Colors.black.withOpacity(0.5),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'IBMPLEXSANSARABICRegular'),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMonthly = true;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: isMonthly
                                        ? AppColors.primaryGreen
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  child: Text(
                                    'شهري',
                                    style: TextStyle(
                                        color: isMonthly
                                            ? Colors.white
                                            : AppColors.primaryGreen,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'IBMPLEXSANSARABICRegular'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    CustomTextButton(
                      onPressed: () {
                        Get.toNamed(
                            AppRoutesName.profileCustomizationChartScreen);
                      },
                      text: 'تأكيد',
                      width: 320.w,
                    ),
                    SizedBox(height: 20.h),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: screenHeight * 0.02,
                      crossAxisSpacing: screenWidth * 0.03,
                      childAspectRatio: 1.5,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index == 9) return const SizedBox();
                      if (index == 11) {
                        return _buildKey("", _removeLastDigit, Icons.backspace); // استخدم دالة الحذف للـ amount
                      }
                      return _buildKey(
                        (index == 10) ? "0" : "${index + 1}",
                        () => _addDigit((index == 10) ? "0" : "${index + 1}"), // استخدم دالة الإضافة للـ amount
                      );
                    },
                  ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
    Widget _buildKey(String number, VoidCallback onTap, [IconData? icon]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, size: 28, color: Colors.black)
              : Text(number,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
