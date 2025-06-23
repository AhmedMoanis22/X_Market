import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildTextField({
  required TextEditingController controller,
  required String hint,
  required String validatorMessage,
  bool? obscureText,
  Widget? prefixIcon,
}) {
  return TextFormField(
    controller: controller,
    textAlign: TextAlign.right,
    style: const TextStyle(
      fontFamily: 'IBMPLEXSANSARABICBold',
    ),
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      prefixIcon: prefixIcon ?? const SizedBox.shrink(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(width: 1.5, color: Colors.grey),
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade400,
        fontFamily: 'IBMPLEXSANSARABICSRegular',
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) return validatorMessage;
      return null;
    },
  );
}
