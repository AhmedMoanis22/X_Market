import 'package:flutter/material.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_home_appbar.dart';
import 'package:x_market/features/wallet/ui/widget/custom_payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHomeAppbar(
        title: Text(
          'الايداع',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'IBMPLEXSANSARABICRegular',
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomPaymentMethod(
              image: Image.asset('assets/images/instapay.png'),
              title: 'إنستا باي',
              subtitle: 'بدون رسوم • يوم عمل واحد',
              onTap: () {},
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/vodafone.png'),
              title: 'فودافون كاش',
              subtitle: 'تطبيق الرسوم • لإيداع لحظي',
              onTap: () {},
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/card.png'),
              title: 'بطاقات الخصم المباشر',
              subtitle: 'تطبيق الرسوم • 5 دقائق للمحفظة',
              onTap: () {},
            ),
            CustomPaymentMethod(
              image: Image.asset('assets/images/bank.png'),
              title: 'تحويل بنكي',
              subtitle: 'بدون رسوم • يوم عمل واحد',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
