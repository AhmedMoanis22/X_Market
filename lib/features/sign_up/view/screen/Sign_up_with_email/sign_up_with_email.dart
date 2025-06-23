import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_market/core/helper/custom_text_button.dart';

import '../../../../../core/utilits/widgets/custom_appbar.dart';
import '../../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../../../bussiness_logic/progress_indecator.dart';
import '../../widget/custom_text_for_identification.dart';
import '../../widget/sign_up_in_marketx_title.dart';
import '../Sign_up_with_names/sign_up_with_names.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgressIndecator(),
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 40.h),
                const SignUpInMarketxTitle(),
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
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Column(
                    children: [
                      BlocBuilder<ProgressIndecator, double>(
                        builder: (context, progress) {
                          return LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.green),
                          );
                        },
                      ),
                      SizedBox(height: 5.h),
                      CustomTextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SignUpCubit>()
                                .updateEmail(emailController.text);
                            context
                                .read<SignUpCubit>()
                                .updatePassword(passwordController.text);

                            context
                                .read<SignUpCubit>()
                                .updateConfirmPassword(passwordController.text);

                            context
                                .read<ProgressIndecator>()
                                .updateProgress(0.1);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                        value:
                                            context.read<ProgressIndecator>()),
                                    BlocProvider.value(
                                        value: context.read<SignUpCubit>()),
                                  ],
                                  child: SignUpWithNames(),
                                ),
                              ),
                            );
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
      ),
    );
  }
}
