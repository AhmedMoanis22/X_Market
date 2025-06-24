import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.style,
      this.width,
      this.buttonColor,
      this.textColor});
  final void Function() onPressed;
  final String text;
  final TextStyle? style;
  final double? width;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor ?? AppColors.primaryGreen,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primaryGreen,
          width: 1.5,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: style ??
              TextStyle(
                fontSize: 16,
                fontFamily: 'IBMPLEXSANSARABICBold',
                color: textColor ?? Colors.white,
              ),
        ),
      ),
    );
  }
}
