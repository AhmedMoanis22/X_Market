import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/app_text_field.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';

class SellStockDetails extends StatelessWidget {
  const SellStockDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('سعر آخر تداول',
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(height: 4),
                              Text('ج.م 48.60',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('11.65%',
                                      style: TextStyle(color: Colors.green)),
                                  SizedBox(width: 4),
                                  Icon(Icons.arrow_upward, color: Colors.green),
                                ],
                              ),
                              SizedBox(width: 8),
                              Text('ج.م 4.23',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 12),
              const Text('سعر محدد ', style: TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'بسعر محدد او افضل بيع',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IBMPLEXSANSARABICSRegular',
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              buildTextField(
                controller: TextEditingController(),
                hint: "ج.م",
                validatorMessage: "يحب ادخال السعر",
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: SvgPicture.asset('assets/icons/dollar.svg'),
                ),
              ),
              SizedBox(height: 10.h),
              const Text(' عدد الوحدات ', style: TextStyle(fontSize: 20)),
              SizedBox(height: 12.h),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '80 واحده متاحة',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IBMPLEXSANSARABICSRegular',
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              buildTextField(
                controller: TextEditingController(),
                hint: "الكل",
                validatorMessage: "يحب ادخال السعر",
                suffixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: SvgPicture.asset('assets/icons/coin.svg'),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal:12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('المبلغ المتوقع', style: TextStyle(fontSize: 16)),
                              SizedBox(width: 10),
                              Text('15000 ج.م',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomTextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutesName.sellstockcheckbox);
                  },
                  text: 'التالي',
                  width: 320.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
