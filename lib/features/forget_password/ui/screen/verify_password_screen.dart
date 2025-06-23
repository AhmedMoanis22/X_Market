import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';
import 'package:x_market/features/sign_up/bussiness_logic/Sign_up/sign_up_cubit.dart';

import '../../../../core/routing/app_routes_name.dart';

class VerifyPasswordScreen extends StatefulWidget {
  const VerifyPasswordScreen({super.key});

  @override
  State<VerifyPasswordScreen> createState() => _VerifyPasswordScreenState();
}

class _VerifyPasswordScreenState extends State<VerifyPasswordScreen> {
  String enteredPin = "";
  final int pinLength = 6;

  void _onNumberPressed(String number) {
    if (enteredPin.length < pinLength) {
      setState(() {
        enteredPin += number;
      });
    }
  }

  void _onDeletePressed() {
    if (enteredPin.isNotEmpty) {
      setState(() {
        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPinComplete = enteredPin.length == pinLength;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                SvgPicture.asset(
                  'assets/icons/email.svg',
                ),
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'اكتب الكود اللي وصلك',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                const Text(
                  'بعتنالك رسالة على إيميلك فيها كود من 6 أرقام',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'IBMPLEXSANSARABICSRegular',
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    pinLength,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: screenWidth * 0.03,
                      height: screenWidth * 0.03,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < enteredPin.length
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: screenHeight * 0.02,
                    crossAxisSpacing: screenWidth * 0.03,
                    childAspectRatio: 1.5,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 9) return const SizedBox();
                    if (index == 11) {
                      return _buildKey("", _onDeletePressed, Icons.backspace);
                    }
                    return _buildKey(
                      (index == 10) ? "0" : "${index + 1}",
                      () => _onNumberPressed(
                          (index == 10) ? "0" : "${index + 1}"),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.07,
              decoration: BoxDecoration(
                color: isPinComplete
                    ? AppColors.primaryGreen
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: isPinComplete
                    ? () {
                        context.read<SignUpCubit>().updatePasscode(enteredPin);

                        Get.toNamed(
                          AppRoutesName.passwordRepeatScreen,
                        );
                      }
                    : null,
                child: const Text(
                  'التالي',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKey(String number, VoidCallback onTap, [IconData? icon]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade200,
        ),
        child: Center(
          child: icon != null
              ? Icon(icon, size: 28, color: Colors.black)
              : Text(number,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
