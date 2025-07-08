import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/theme/colors.dart';

import '../../../../core/utilits/widgets/custom_text_button.dart';
import '../../../../core/utilits/widgets/transaction_text.dart';

class StockProfileChart extends StatefulWidget {
  const StockProfileChart({super.key});

  @override
  State<StockProfileChart> createState() => _StockProfileChartState();
}

class _StockProfileChartState extends State<StockProfileChart> {
  final List<String> types = [
    'التفاصيل',
    'موقفك',
    'الطلبات',
    'الأخبار',
    'التوزيعات',
  ];

  int selectedType = 0;

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final stockName = args['stockName'];
    final stockSymbol = args['stockSymbol'];
    final stockLogo = args['stockLogo'];
    final investmentAmount = args['investmentAmount'];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryGreen,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/notification_ourline.svg',
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/heart.svg',
                  ),
                ],
              ),
            ),
          ],
          title: Row(
            children: [
              SvgPicture.asset(
                stockLogo,
                width: 24.w,
                height: 24.h,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                stockName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  EdgeInsets.only(left: index == 0 ? 0 : 8),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedType = index;
                                  });
                                },
                                child: TransactionText(
                                  selected: selectedType == index,
                                  text: types[index],
                                ),
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemCount: types.length,
                        scrollDirection: Axis.horizontal),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'سعر آخر تداول',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: 'IBMPLEXSANSARABICSRegular',
                              color: AppColors.primaryGreen,
                            ),
                          ),
                          Text(
                            '${(double.tryParse(investmentAmount) ?? 0.0) - 5.00}'
                            '\$  ',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: 'IBMPLEXSANSARABICSemiBold',
                              color: AppColors.primaryGreen,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '11.65%',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'IBMPLEXSANSARABICSRegular',
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                          Text(
                            '(+5.66 .' '\$)',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'IBMPLEXSANSARABICSemiBold',
                              color: AppColors.secondaryGreen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Image.asset(
                    'assets/images/stock_chart.png',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      'assets/svg/weekly_stock.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text('الإحصائيات',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: 'IBMPLEXSANSARABICSemiBold',
                            color: AppColors.primaryGreen,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      const Icon(
                        Icons.info,
                        color: AppColors.primaryGreen,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SvgPicture.asset('assets/svg/static.svg'),
                ],
              ),
              const Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomTextButton(
                  onPressed: () {},
                  text: 'شراء',
                  width: 150,
                ),
                const SizedBox(width: 16),
                CustomTextButton(
                  onPressed: () {},
                  text: 'بيع',
                  width: 150,
                  buttonColor: Colors.white,
                  textColor: AppColors.primaryGreen,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
