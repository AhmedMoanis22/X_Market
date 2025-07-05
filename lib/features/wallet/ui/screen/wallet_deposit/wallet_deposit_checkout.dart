import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/custom_home_appbar.dart';
import '../../widget/custom_wallet_checkout_widget.dart';

class WalletDepositCheckout extends StatelessWidget {
  const WalletDepositCheckout({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppbar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'IBMPLEXSANSARABICBold',
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تفاصيل الدفع',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICSSemiBold',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    CustomWalletCheckoutWidget(
                      title: 'مبلغ الاستثمار',
                      value: '5000 ج.م',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'الرسوم',
                      value: '105 ج.م',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'الإجمالي',
                      value: '5105 ج.م',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'بيانات البطاقة',
                        style: TextStyle(
                            fontFamily: 'IBMPLEXSANSARABICSSemiBold',
                            color: AppColors.gray),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'رقم البطاقة',
                      value: 'XXXX-XXXX-XXXX-56454',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'تاريخ الصلاحية',
                      value: '01/30',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'CVV',
                      value: 'XX7',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomWalletCheckoutWidget(
                      title: 'اسم حامل البطاقة',
                      value: 'Abdelrahman Othman',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
