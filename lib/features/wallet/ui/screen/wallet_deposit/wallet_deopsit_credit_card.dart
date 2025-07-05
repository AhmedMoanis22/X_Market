import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';

import '../../../../../../../../core/theme/colors.dart';
import '../../../../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../../../../../core/utilits/widgets/custom_home_appbar.dart';
import 'wallet_deposit_details.dart';

class WalletDeopsitCreditCard extends StatefulWidget {
  const WalletDeopsitCreditCard({super.key, required this.title});
  final String title;

  @override
  State<WalletDeopsitCreditCard> createState() =>
      _WalletDeopsitCreditCardState();
}

class _WalletDeopsitCreditCardState extends State<WalletDeopsitCreditCard> {
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
      appBar: CustomHomeAppbar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'IBMPLEXSANSARABICBold',
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const CustomSubHeadText(
                      text: 'اكتب مبلغ الإيداع',
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
                          amount,
                          style: TextStyle(
                            fontSize: 45.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '105 ج.م',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'IBMPLEXSANSARABICBold'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'رسوم الخدمة',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'IBMPLEXSANSARABICSRegular'),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletDepositDetails(
                                      title: widget.title,
                                    )));
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
                          return _buildKey("", _removeLastDigit,
                              Icons.backspace); // استخدم دالة الحذف للـ amount
                        }
                        return _buildKey(
                          (index == 10) ? "0" : "${index + 1}",
                          () => _addDigit((index == 10)
                              ? "0"
                              : "${index + 1}"), // استخدم دالة الإضافة للـ amount
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
