import 'package:flutter/widgets.dart';
import 'package:x_market/core/theme/colors.dart';

class CustomWalletCheckoutWidget extends StatelessWidget {
  const CustomWalletCheckoutWidget(
      {super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'IBMPLEXSANSARABICSSemiBold',
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: 'IBMPLEXSANSARABICSRegular',
              color: AppColors.gray),
        ),
      ],
    );
  }
}
