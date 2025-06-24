import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:x_market/core/di/dependeny_injection.dart';
import 'package:x_market/features/login/bussiness_logic/login_state.dart';

import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utilits/widgets/custom_text_button.dart';
import '../../bussiness_logic/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmailAndPasswordState createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  final formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: formKey,
        child: BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الايميل',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'IBMPLEXSANSARABICBold',
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.grey),
                  ),
                  hintText: "اكتب الإيميل الشخصي",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: 'IBMPLEXSANSARABICSRegular'),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/sms.svg'),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب إدخال الإيميل";
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "يجب إدخال إيميل صحيح";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'كلمة السر',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                controller: passwordController,
                obscureText: _obscureText,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontFamily: 'IBMPLEXSANSARABICBold',
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 1.5),
                  ),
                  hintText: "اكتب كلمة السر",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontFamily: 'IBMPLEXSANSARABICSRegular'),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset('assets/icons/lock.svg'),
                  ),
                  prefixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        _obscureText
                            ? 'assets/icons/eye_slash.svg'
                            : 'assets/icons/vector.svg',
                      ),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "يجب إدخال كلمة السر";
                  } else if (value.length < 6) {
                    return "يجب أن تكون كلمة السر على الأقل 6 أحرف";
                  }
                  return null;
                },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutesName.forgotPasswordScreen);
                  },
                  child: const Text(
                    'نسيت كلمة السر؟',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: AppColors.brightBlue,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutesName.sign_up_with_email);
                    },
                    child: const Text(
                      'أنشأ حساب الآن',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'IBMPLEXSANSARABICSemiBold',
                        color: AppColors.brightBlue,
                      ),
                    ),
                  ),
                  const Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    Fluttertoast.showToast(
                      msg: state.authModel.status,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    Get.toNamed(AppRoutesName.home);
                  }
                  if (state is LoginFailure) {
                    Fluttertoast.showToast(
                      msg: state.errorMessage,
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
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().usrtLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                    text: 'تسجيل الدخول',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
