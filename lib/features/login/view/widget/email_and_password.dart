import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/helper/custom_text_button.dart';
import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/theme/colors.dart';

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
                  borderSide: const BorderSide(width: 1.5, color: Colors.grey),
                ),
                hintText: "اكتب الإيميل الشخصي",
                hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontFamily: 'IBMPLEXSANSARABICSRegular'),
                suffixIcon: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.mail_outline, color: Colors.black),
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
                  child: SvgPicture.asset(
                    'assets/icons/lock.svg',
                  ),
                ),
                prefixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: _togglePasswordVisibility,
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
                onPressed: () {},
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
                    Get.toNamed(AppRoutesName.sign_up);
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
            CustomTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("تم تسجيل الدخول بنجاح"),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              text: 'تسجيل الدخول',
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('تسجيل الدخول'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
