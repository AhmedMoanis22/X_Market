import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/theme/colors.dart';

class BuyStock extends StatefulWidget {
  const BuyStock({super.key});

  @override
  State<BuyStock> createState() => _BuyStockState();
}

class _BuyStockState extends State<BuyStock> {
  int selected = 0;
  final List<Map<String, String>> options = [
    {
      'title': 'قيمة نقدية (سعر السوق)',
      'subtitle': 'بيع قيمة نقدية على أفضل سعر سوق متوفر',
    },
    {
      'title': 'عدد وحدات (سعر السوق)',
      'subtitle': 'بيع عدد وحدات على أفضل سعر سوق متوفر',
    },
    {
      'title': 'طلب بسعر محدد',
      'subtitle': 'التنفيذ بالسعر المحدد أو أفضل',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.primaryGreen,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                '(شراء)',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                  color: Colors.white,
                ),
              ),
            ),
          ],
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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(
                'assets/icons/arrow-square-right.svg',
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'اختر طريقة الشراء',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              ...List.generate(options.length, (index) {
                final isSelected = selected == index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.lightblue2
                          : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryGreen
                            : Colors.grey.shade300,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                options[index]['title']!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'IBMPLEXSANSARABICBold',
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                options[index]['subtitle']!,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.gray,
                                  fontFamily: 'IBMPLEXSANSARABICRegular',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_back_ios,
                            size: 16, color: Colors.grey)
                      ],
                    ),
                  ),
                );
              }),
              // باقي الصفحة فارغ كما في الصورة
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
