import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../../core/helper/custom_text_button.dart';
import '../../../../../core/routing/app_routes_name.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/app_text_field.dart';
import '../../../../../core/utilits/widgets/custom_appbar.dart';
import '../../../sign_up/view/widget/custom_text_for_identification.dart';

class PasswordRepeatScreen extends StatelessWidget {
  PasswordRepeatScreen({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'إنشاء كلمة السر للحساب',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                        ),
                      ),
                      SizedBox(height: 40.h),
                      const CustomTextForIdentification(text: "كلمة السر"),
                      SizedBox(height: 8.h),
                      buildTextField(
                        controller: passwordController,
                        hint: "اكتب كلمة سر للحساب",
                        validatorMessage: "يجب إدخال كلمة السر",
                        obscureText: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/icons/eye_slash.svg'),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => Expanded(
                            child: Container(
                              height: 4.h,
                              margin: EdgeInsets.symmetric(horizontal: 4.w),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEAEAEA),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      const CustomTextForIdentification(
                          text: "تأكيد كلمة السر"),
                      SizedBox(height: 8.h),
                      buildTextField(
                        controller: confirmPasswordController,
                        hint: "اكتب نفس كلمة السر ",
                        validatorMessage: "يجب إدخال كلمة السر",
                        obscureText: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset('assets/icons/eye_slash.svg'),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'الباسورد لازم يكون على الأقل من 8 لـ 12 حرف •',
                            style: TextStyle(
                              color: AppColors.primaryGreen,
                              fontSize: 15,
                              fontFamily: 'IBMPLEXSANSARABICREGULAR',
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 4.h),
                          const Text(
                            'لازم يبقى فيه حروف كابيتال (كبيرة) وحروف سمول (صغيرة) • ',
                            style: TextStyle(
                              color: AppColors.primaryGreen,
                              fontSize: 15,
                              fontFamily: 'IBMPLEXSANSARABICREGULAR',
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(height: 4.h),
                          const Text(
                            'وكمان لازم يحتوي على رقم واحد على الأقل ورمزي ! أو @ أو # مثلاً • ',
                            style: TextStyle(
                              color: AppColors.primaryGreen,
                              fontSize: 15,
                              fontFamily: 'IBMPLEXSANSARABICREGULAR',
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h), // مسافة بسيطة قبل الزر لو أردت
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: CustomTextButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "تم تغيير كلمة السر بنجاح",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Future.delayed(
                      const Duration(seconds: 1),
                      () => Get.toNamed(AppRoutesName.login_in),
                    );
                  },
                  text: 'تسجيل الدخول',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
