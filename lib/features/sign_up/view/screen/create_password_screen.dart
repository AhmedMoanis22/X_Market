import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utilits/widgets/custom_appbar.dart';
import '../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import 'confirm_password_screen.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
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

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Image.asset('assets/images/lock.png'),
            const SizedBox(height: 25),
            const Text(
              'انشاء كلمة مرور سريعة',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'IBMPLEXSANSARABICBold',
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'عشان تسجل بيها كل مرة تفتح التطبيق',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'IBMPLEXSANSARABICSRegular',
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                pinLength,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < enteredPin.length
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                itemCount: 12,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
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
                    () =>
                        _onNumberPressed((index == 10) ? "0" : "${index + 1}"),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<SignUpCubit, double>(
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: isPinComplete
                      ? AppColors.primaryGreen
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: isPinComplete
                      ? () {
                          context.read<SignUpCubit>().updateProgress(0.4);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: context.read<SignUpCubit>(),
                                child: const ConfirmPasswordScreen(),
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
          ],
        ),
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
