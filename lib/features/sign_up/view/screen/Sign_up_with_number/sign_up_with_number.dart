import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:x_market/features/sign_up/bussiness_logic/Sign_up/sign_up_state.dart';

import '../../../../../core/routing/app_routes_name.dart';
import '../../../../../core/utilits/widgets/custom_appbar.dart';
import '../../../../../core/utilits/widgets/custom_text_button.dart';
import '../../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../../../bussiness_logic/progress_indecator.dart';
import '../../widget/sign_up_in_marketx_title.dart';

class SignUpWithNumber extends StatefulWidget {
  const SignUpWithNumber({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpWithNumberState createState() => _SignUpWithNumberState();
}

class _SignUpWithNumberState extends State<SignUpWithNumber> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignUpInMarketxTitle(),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "رقم الموبايل",
                      hintText: "اكتب موبايلك الشخصي",
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "يجب إدخال رقم الهاتف";
                      }
                      // ignore: curly_braces_in_flow_control_structures
                      else if (value.length < 7 || value.length > 12) {
                        return "خطأ في رقم الموبايل";
                      } else if (!value.startsWith('01')) {
                        return "رقم الموبايل يجب أن يبدأ بـ 01";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: birthdayController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "تاريخ الميلاد",
                      hintText: "حدد يوم ميلادك",
                      prefixIcon: const Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          birthdayController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        BlocBuilder<ProgressIndicatorCubit, double>(
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
                        BlocConsumer<SignUpCubit, SignUpState>(
                          listener: (context, state) {
                            if (state.status == SignUpStatus.success) {
                              Fluttertoast.showToast(
                                msg: state.status.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Get.toNamed(AppRoutesName.login_in);
                            }
                            if (state.status == SignUpStatus.failure) {
                              Fluttertoast.showToast(
                                msg: state.errorMessage!,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomTextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<SignUpCubit>().updatePhone(phoneController.text);
                                  context.read<SignUpCubit>().updateBirthDate(birthdayController.text);
                                  context.read<ProgressIndicatorCubit>().nextStep();

                                  Get.toNamed(AppRoutesName.finish_little_steps); // ← هنا فقط
                                }
                                // لا تضع Get.toNamed خارج if
                              },
                              text: 'التالي',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
