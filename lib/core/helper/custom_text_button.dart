import 'package:flutter/material.dart';
import 'package:x_market/core/theme/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.onPressed, required this.text, this.style});
  final void Function() onPressed;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: style ??
                const TextStyle(
                  fontSize: 16,
                  fontFamily: 'IBMPLEXSANSARABICBold',
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
