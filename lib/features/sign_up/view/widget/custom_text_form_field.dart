import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon, required this.validator});
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String Function(String?) validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: 'IBMPLEXSANSARABICBold',
      ),
      keyboardType: keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(width: 1.5, color: Colors.grey),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontFamily: 'IBMPLEXSANSARABICSRegular',
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
