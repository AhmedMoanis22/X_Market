import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/app_text_field.dart';
import '../../../../../core/utilits/widgets/custom_home_appbar.dart';
import '../../../../../core/utilits/widgets/custom_text_button.dart';
import '../../../../../core/utilits/widgets/input_formatters.dart';
import '../../../data/model/transction_model.dart';
import 'wallet_deposit_checkout.dart';

class WalletDepositDetails extends StatelessWidget {
  WalletDepositDetails({super.key, required this.title, required this.amount});
  final String title;
  final String amount;

  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController expireDate = TextEditingController();
  final TextEditingController cvv = TextEditingController();
  final TextEditingController cardUserName = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'إدخال تفاصيل البطاقة',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'IBMPLEXSANSARABICSSemiBold',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رقم البطاقه',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'IBMPLEXSANSARABICSRegular',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  buildTextField(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/card.svg'),
                    ),
                    controller: cardNumber,
                    hint: "0000 0000 0000 0000",
                    validatorMessage: "يحب ادخال رقم البطاقه",
                    inputFormatters: [CardNumberFormatter()],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'CVV',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'IBMPLEXSANSARABICSRegular',
                              ),
                            ),
                            SizedBox(height: 10.h),
                            buildTextField(
                              controller: cvv,
                              hint: "3 digits",
                              validatorMessage: "يجب ادخال رقم cvv",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'تاريخ الصلاحية',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'IBMPLEXSANSARABICSRegular',
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            buildTextField(
                              controller: expireDate,
                              hint: "MM/YY",
                              validatorMessage: "يحب ادخال تاريخ البطاقه",
                              inputFormatters: [ExpiryDateFormatter()],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                    SizedBox(height: 20.h),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'اسم حامل البطاقة',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'IBMPLEXSANSARABICSRegular',
                      ),
                    ),
                  ),
                    SizedBox(height: 20.h),
                  buildTextField(
                    controller: cardUserName,
                    hint: "الاسم الموجود على البطاقة",
                    validatorMessage: "يحب ادخال اسم مستخدم البطاقه",
                  ),
                ],
              ),
            ),
            CustomTextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WalletDepositCheckout(
                      title: title,
                      amount: amount,
                      cvv: cvv.text,
                      cardHolderName: cardUserName.text,
                      cardNumber: cardNumber.text,
                      expiryDate: expireDate.text,
                    ),
                  ),
                ).then((result) {
                  if (result != null && result is TransactionModel) {
                    Navigator.pop(context, result); // 👈 رجّع النتيجة للأب
                  }
                });
              },
              text: 'حفظ',
            ),
          ],
        ),
      ),
    );
  }
}
