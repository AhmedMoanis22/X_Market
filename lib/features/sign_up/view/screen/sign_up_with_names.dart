import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SignUpInMarketxTitle(),
                const SizedBox(height: 24),
                const CustomTextForIdentification(text: 'الاسم الأول'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: firstNameController,
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
                    hintText: 'اكتب اسمك الأول زي البطاقة',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "يجب إدخال الاسم الأول";

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const CustomTextForIdentification(text: 'الاسم الأوسط'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: secondNameController,
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
                    hintText: 'اكتب اسمك الأوسط زي البطاقة',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "يجب إدخال الاسم الأوسط";

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const CustomTextForIdentification(text: 'اسم العائلة'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: lastNameController,
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
                    hintText: 'اكتب اسم العائلة زي البطاقة',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: 'IBMPLEXSANSARABICSRegular',
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "يجب إدخال اسم العائلة";

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const CustomTextForIdentification(text: 'اسم المستخدم'),
                const SizedBox(height: 5),
                TextFormField(
                  controller: popularNameController,
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
                      hintText: 'اكتب الاسم اللي تحب تظهر بيه',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontFamily: 'IBMPLEXSANSARABICSRegular',
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset('assets/icons/profile.svg'),
                      )),
                  validator: (value) {
                    if (value!.isEmpty) return "يجب إدخال اسم المستخدم";

                    return null;
                  },
                ),
                const SizedBox(height: 200),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
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
                      const SizedBox(height: 5),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
