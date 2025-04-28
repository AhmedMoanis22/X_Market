import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/custom_text_button.dart';
import '../../../../core/utilits/widgets/custom_appbar.dart';
import '../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../widget/custom_text_for_identification.dart';
import '../widget/sign_up_in_marketx_title.dart';
import 'sign_up_with_country.dart';

class SignUpWithNames extends StatelessWidget {
  SignUpWithNames({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController popularNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 40.h),
                          const SignUpInMarketxTitle(),
                          SizedBox(height: 20.h),
                          const CustomTextForIdentification(
                              text: "الاسم الأول"),
                          SizedBox(height: 8.h),
                          buildTextField(
                            controller: firstNameController,
                            hint: "اكتب الاسم الأول",
                            validatorMessage: "يجب إدخال الاسم الأول",
                          ),
                          SizedBox(height: 20.h),
                          const CustomTextForIdentification(
                              text: "الاسم الثاني"),
                          SizedBox(height: 8.h),
                          buildTextField(
                            controller: secondNameController,
                            hint: "اكتب الاسم الثاني",
                            validatorMessage: "يجب إدخال الاسم الثاني",
                          ),
                          SizedBox(height: 20.h),
                          const CustomTextForIdentification(
                              text: "الاسم الأخير"),
                          SizedBox(height: 8.h),
                          buildTextField(
                            controller: lastNameController,
                            hint: "اكتب الاسم الأخير",
                            validatorMessage: "يجب إدخال الاسم الأخير",
                          ),
                          SizedBox(height: 20.h),
                          const CustomTextForIdentification(
                              text: "الاسم الشائع"),
                          SizedBox(height: 8.h),
                          buildTextField(
                            controller: popularNameController,
                            hint: "اكتب الاسم الشائع",
                            validatorMessage: "يجب إدخال الاسم الشائع",
                          ),
                          const Spacer(),
                          BlocBuilder<SignUpCubit, double>(
                            builder: (context, progress) {
                              return LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.grey[300],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.green),
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          CustomTextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<SignUpCubit>().updateProgress(0.2);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                      value: context.read<SignUpCubit>(),
                                      child: const CountrySelectionScreen(),
                                    ),
                                  ),
                                );
                              }
                            },
                            text: 'التالي',
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required String validatorMessage,
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      style: const TextStyle(
        fontFamily: 'IBMPLEXSANSARABICBold',
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
}
