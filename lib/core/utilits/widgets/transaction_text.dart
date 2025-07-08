import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_market/core/theme/colors.dart';

class TransactionText extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback? onTap;

  const TransactionText({
    super.key,
    required this.text,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryGreen : const Color.fromRGBO(0, 0, 0, 0),
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            // ignore: deprecated_member_use
            color: selected ? Colors.white : Colors.black.withOpacity(0.5),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'IBMPLEXSANSARABICRegular',
          ),
        ),
      ),
    );
  }
}