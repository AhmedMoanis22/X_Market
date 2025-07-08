import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/custom_home_appbar.dart';
import '../../../../../core/utilits/widgets/custom_text_button.dart';
import '../../../data/model/transction_model.dart';
import '../../../logic/wallet_cubit.dart';
import '../../widget/custom_wallet_checkout_widget.dart';

class WalletDepositCheckout extends StatelessWidget {
  const WalletDepositCheckout(
      {super.key,
      required this.title,
      required this.amount,
      required this.cardNumber,
      required this.expiryDate,
      required this.cvv,
      required this.cardHolderName});
  final String title;
  final String amount;
  final String cardNumber;
  final String expiryDate;
  final String cvv;
  final String cardHolderName;

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
            Expanded(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Column(
                        children: [
                          CustomWalletCheckoutWidget(
                            title: 'مبلغ الاستثمار',
                            value: '$amount ج.م',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const CustomWalletCheckoutWidget(
                            title: 'الرسوم',
                            value: '105 ج.م',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomWalletCheckoutWidget(
                            title: 'الإجمالي',
                            value: '${(int.parse(amount) + 105)} ج.م',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'بيانات البطاقة',
                              style: TextStyle(
                                  fontFamily: 'IBMPLEXSANSARABICSSemiBold',
                                  color: AppColors.gray),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomWalletCheckoutWidget(
                            title: 'رقم البطاقة',
                            value: cardNumber,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomWalletCheckoutWidget(
                            title: 'تاريخ الصلاحية',
                            value: expiryDate,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomWalletCheckoutWidget(
                            title: 'CVV',
                            value: cvv,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomWalletCheckoutWidget(
                            title: 'اسم حامل البطاقة',
                            value: cardHolderName,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomTextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (dialogContext) {
                    bool isSuccess = false;
                    bool dialogIsOpen = true;

                    Future.delayed(const Duration(seconds: 8), () {
                      if (dialogIsOpen && (dialogContext as Element).mounted) {
                        (dialogContext).markNeedsBuild();
                        isSuccess = true;
                      }
                    });

                    Future.delayed(const Duration(seconds: 10), () {
                      if (dialogIsOpen && (dialogContext as Element).mounted) {
                        dialogIsOpen = false;

                        final transaction = TransactionModel(
                          type: 'إيداع',
                          amount: double.parse(amount),
                          date: DateTime.now(),
                        );
                        context.read<WalletCubit>().addTransaction(transaction);

                        // ارجع لBottomNavigationBarScreen
                        Get.offAllNamed(AppRoutesName.bottomNavBarScreen);
                      }
                    });

                    return StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              isSuccess
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green, size: 40)
                                  : const CircularProgressIndicator(),
                              const SizedBox(height: 20),
                              Text(
                                isSuccess
                                    ? "تم تنفيذ عملية الإيداع بنجاح"
                                    : "يتم تنفيذ عملية الإيداع...",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              text: 'تأكيد',
            ),
          ],
        ),
      ),
    );
  }
}
