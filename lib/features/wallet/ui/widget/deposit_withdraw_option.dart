import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/theme/colors.dart';

class DepositWithdrawOptions extends StatefulWidget {
  const DepositWithdrawOptions({super.key});

  @override
  State<DepositWithdrawOptions> createState() => _DepositWithdrawOptionsState();
}

class _DepositWithdrawOptionsState extends State<DepositWithdrawOptions> {
  String selected = 'الإيداع';
  final List<String> options = ['الإيداع', 'السحب'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...options.map((option) {
            final isSelected = selected == option;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  setState(() {
                    selected = option;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.secondaryGreen.withOpacity(0.2)
                        : Colors.white,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryGreen
                          : AppColors.Neutral,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        isSelected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked,
                        color: isSelected
                            ? AppColors.primaryGreen
                            : AppColors.Neutral,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          fontFamily: 'IBMPLEXSANSARABICRegular',
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutesName.paymentScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'تأكيد',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'IBMPLEXSANSARABICBold',
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
