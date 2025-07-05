import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_home_appbar.dart';
import 'package:x_market/features/wallet/ui/screen/wallet_deposit/wallet_deopsit_credit_card.dart';
import 'package:x_market/features/wallet/ui/widget/custom_payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomHomeAppbar(
        title: Text(
          'الايداع',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'IBMPLEXSANSARABICBold',
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'اختر وسيلة الإيداع',
              style:
                  TextStyle(fontSize: 18, fontFamily: 'IBMPLEXSANSARABICBold'),
            ),
            const SizedBox(height: 16),
            CustomPaymentMethod(
              image: Image.asset('assets/images/instapay.png'),
              title: 'إنستا باي',
              subtitle: 'بدون رسوم • يوم عمل واحد',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const WalletDeopsitCreditCard(title: 'إنستا باي')));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/vodafone.png'),
              title: 'فودافون كاش',
              subtitle: 'تطبيق الرسوم • لإيداع لحظي',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletDeopsitCreditCard(
                            title: 'فودافون كاش')));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/card.png'),
              title: 'بطاقات الخصم المباشر',
              subtitle: 'تطبيق الرسوم • 5 دقائق للمحفظة',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletDeopsitCreditCard(
                            title: 'بطاقات الخصم المباشر')));
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/bank.png'),
              title: 'تحويل بنكي',
              subtitle: 'بدون رسوم • يوم عمل واحد',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WalletDeopsitCreditCard(
                              title: 'تحويل بنكي',
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
