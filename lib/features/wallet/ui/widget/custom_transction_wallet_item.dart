import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/colors.dart';
import '../../data/model/transction_model.dart';

class CustomTransctionWalletItem extends StatelessWidget {
  const CustomTransctionWalletItem({super.key, required this.tx});
  final TransactionModel tx;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.Neutral,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${tx.amount.toString()} ج.م',
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tx.type,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'IBMPLEXSANSARABICBold',
                      color: AppColors.primaryGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd – HH:mm').format(tx.date),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
