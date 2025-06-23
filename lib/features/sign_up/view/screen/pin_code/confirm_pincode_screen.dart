import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/theme/colors.dart';
import '../../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../../../bussiness_logic/progress_indecator.dart';
import '../Sign_up_with_number/sign_up_with_number.dart';

class ConfirmPincodeScreen extends StatefulWidget {
  const ConfirmPincodeScreen({super.key});

  @override
  State<ConfirmPincodeScreen> createState() => _ConfirmPasswordScreenState();
}

class _ConfirmPasswordScreenState extends State<ConfirmPincodeScreen> {
  String enteredPin = "";
  final int pinLength = 4;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Image.asset('assets/images/lock.png',
                      width: screenWidth * 0.3),
                  SizedBox(height: screenHeight * 0.03),
                  const Text(
                    'التحقق من كلمة المرور',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBMPLEXSANSARABICBold',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    'عشان تسجل بيها كل مرة تفتح التطبيق',
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
                  SizedBox(height: screenHeight * 0.02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: BlocBuilder<ProgressIndicatorCubit, double>(
                      builder: (context, progress) {
                        return LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.green),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.01),
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
                                context
                                    .read<SignUpCubit>()
                                    .updateConfirmPasscode(enteredPin);
                                context
                                    .read<ProgressIndicatorCubit>()
                                    .nextStep();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MultiBlocProvider(
                                      providers: [
                                        BlocProvider.value(
                                            value: context.read<
                                                ProgressIndicatorCubit>()),
                                        BlocProvider.value(
                                            value: context.read<SignUpCubit>()),
                                      ],
                                      child: const SignUpWithNumber(),
                                    ),
                                  ),
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
                  SizedBox(
                      height:
                          screenHeight * 0.02), // Add some space at the bottom
                ],
              ),
            ),
          );
        },
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
