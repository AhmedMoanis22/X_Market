// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomLoginWidget extends StatelessWidget {
  const CustomLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Positioned(

            child: Column(
              children: [
                const CustomText(
                  text: '!أهلا بيك في ماركت إكس',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'التسجيل من خلال جوجل أو أبل',
                  color: Color(0xFF666666),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(height: 20),
                const CustomButton(
                  text: 'التسجيل باستخدام أبل',
                  color: Color(0xFF030303),
                  imagePath: 'assets/images/apple.png',
                ),
                const SizedBox(height: 20),
                const CustomButton(
                  text: 'التسجيل باستخدام جوجل',
                  color: Color(0xFF3C84F4),
                  imagePath: 'assets/images/google.png',
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFB3B3B3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomText({
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'IBM Plex Sans Arabic',
          fontWeight: fontWeight,
          height: 1.0,
          letterSpacing: 0.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final String imagePath;

  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 56,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 56,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'IBM Plex Sans Arabic',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 12),
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
