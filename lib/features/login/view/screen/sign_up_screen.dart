import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_market/core/helper/custom_text_button.dart'; // استيراد الزر المخصص

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset('assets/icons/arrow_back.svg'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h), // رفع المحتوى للأعلى
              Align(
                alignment: Alignment.center,
                child: Text(
                  'إنشاء حساب في ماركت إكس',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الايميل',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: TextEditingController(),
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'IBMPLEXSANSARABICBold',
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.grey),
                  ),
                  hintText: "اكتب الإيميل الشخصي",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: 'IBMPLEXSANSARABICSRegular',
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: const Icon(Icons.mail_outline, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 450.h),
            CustomTextButton(
                  onPressed: () {},
                  text: 'التالي',
                  child : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
