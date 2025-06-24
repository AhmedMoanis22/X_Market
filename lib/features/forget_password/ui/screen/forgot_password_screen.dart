import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import 'package:x_market/core/utilits/widgets/custom_text_button.dart';
import 'package:x_market/features/sign_up/view/widget/custom_text_for_identification.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const Text(
                      'نسيت كلمة السر؟',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'IBMPLEXSANSARABICBold',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const CustomTextForIdentification(
                      text: "الإيميل",
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: emailController,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontFamily: 'IBMPLEXSANSARABICBold',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
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
                          child: SvgPicture.asset('assets/icons/sms.svg'),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return "يجب إدخال الإيميل";
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return "يجب إدخال إيميل صحيح";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: const AlignmentDirectional(0.8, 1),
                      child: Text(
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        'هنبعتلك رسالة فيها كود من 4 أرقام على إيميلك',
                        style: TextStyle(
                          fontFamily: 'IBMPLEXSANSARABICBold',
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    CustomTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Get.toNamed(AppRoutesName.verifyPasswordScreen);
                        }
                      },
                      text: 'التالي',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
