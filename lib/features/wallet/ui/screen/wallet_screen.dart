import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/transaction_text.dart';

import '../../../../core/routing/app_routes_name.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    int selectedType = 0;
    final List<String> types = [
      'الكل',
      'التمويل',
      'الاستثمار',
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.025,
            ),
            color: AppColors.primaryGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/user.svg',
                  ),
                ),
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.moreGray,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: '...ابحث',
                          border: InputBorder.none,
                          icon: Icon(Icons.search),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/icons/chart-2.svg',
                  height: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/icons/notification.svg',
                  height: 30,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // خلفية المحفظة والرصيد
              SizedBox(
                height: screenHeight * 0.32,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/wallet_background.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'رصيد المحفظة',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'ج.م 0.00',
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.yellowAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.025),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/received.svg',
                                ),
                                label: const Text('سحب'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      // ignore: deprecated_member_use
                                      Colors.white.withOpacity(0.2),
                                  foregroundColor: Colors.yellowAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/send.svg',
                                ),
                                label: const Text('إيداع'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white.withOpacity(0.2),
                                  foregroundColor: Colors.yellowAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // مسافة مرنة
              SizedBox(height: screenHeight * 0.025),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 75,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: AppColors.Neutral,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutesName.transactionScreen);
                            },
                            child: const Text(
                              'عرض الكل',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'أحدث المعاملات',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'IBMPLEXSANSARABICBold',
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/frame.svg',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        types.length,
                        (i) => Padding(
                          padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                          child: TransactionText(
                            text: types[types.length - 1 - i],
                            selected: selectedType == types.length - 1 - i,
                            onTap: () {
                              setState(() {
                                selectedType = types.length - 1 - i;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // صورة فارغة ونص
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.13,
                    child: Image.asset('assets/images/emptyInbox.png'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'معندكش أي معاملات جديدة حاليًا',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // مسافة مرنة
              const Spacer(),
              // أحدث المعاملات في الأسفل
            ],
          ),
        ),
      ),
    );
  }
}
