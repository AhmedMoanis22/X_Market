import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_sub_head_text.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';
class SellStockCash extends StatefulWidget {
  final bool isAmountMode;
  const SellStockCash({super.key, this.isAmountMode = true});

  @override
  State<SellStockCash> createState() => _SellStockCashState();
}

class _SellStockCashState extends State<SellStockCash> {
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

  void _onNextPressed() {
    if (widget.isAmountMode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SellStockCash(isAmountMode: false),
        ),
      );
    } else {
      Get.toNamed(AppRoutesName.sellstockdetails);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double? unitsValue;
    try {
      unitsValue = double.parse(amount) / 36.25;
    } catch (_) {
      unitsValue = 0;
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryGreen,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(
                'assets/icons/arrow-square-right.svg',
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
          title: Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/adib.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '(بيع)',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      CustomSubHeadText(
                        text: widget.isAmountMode
                            ? 'اكتب المبلغ'
                            : 'اكتب عدد الوحدات',
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.isAmountMode ? 'ج.م' : 'وحدات',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.refresh, size: 18),
                          const SizedBox(width: 6),
                          const Text(
                            'يساوي تقريباً',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'IBMPLEXSANSARABICBold'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${unitsValue.toStringAsFixed(2)} وحدات',
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'IBMPLEXSANSARABICBold',
                            ),
                          ),
                          const SizedBox(width: 4),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      CustomTextButton(
                        onPressed: _onNextPressed,
                        text: 'التالي',
                        width: 320.w,
                      ),
                      SizedBox(height: 20.h),
                      widget.isAmountMode
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text('سعر آخر تداول',
                                                style: TextStyle(fontSize: 14)),
                                            SizedBox(height: 4),
                                            Text('ج.م 48.60',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('المبلغ المتاح',
                                                style: TextStyle(fontSize: 14)),
                                            SizedBox(height: 4),
                                            Text('ج.م 6515.60',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('سعر آخر تداول',
                                                style: TextStyle(fontSize: 14)),
                                            SizedBox(height: 4),
                                            Text('ج.م 48.60',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('الوحدات المتاحة',
                                                style: TextStyle(fontSize: 14)),
                                            SizedBox(height: 4),
                                            Text('100 وحدات',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                              ],
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
                            return _buildKey(
                                "", _removeLastDigit, Icons.backspace);
                          }
                          return _buildKey(
                            (index == 10) ? "0" : "${index + 1}",
                            () =>
                                _addDigit((index == 10) ? "0" : "${index + 1}"),
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
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
