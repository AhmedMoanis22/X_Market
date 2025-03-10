import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLoginWidget extends StatelessWidget {
  const CustomLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              width: 200,
              height: 20,
              alignment: Alignment.center,
              child: const Text(
                '!أهلا بيك في ماركت إكس',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w700,
                  height: 1.0, // line-height: 100%
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20), // مسافة بين النصين
            Container(
              width: 166,
              height: 21,
              alignment: Alignment.center,
              child: const Text(
                'التسجيل من خلال جوجل أو أبل',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 14,
                  fontFamily: 'IBM Plex Sans Arabic',
                  fontWeight: FontWeight.w400,
                  height: 1.0, // line-height: 100%
                  letterSpacing: 0.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20), // مسافة بين النصوص والأزرار
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // عرض متجاوب
              height: 56,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // عرض متجاوب
                      height: 56,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF030303),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 90,
                    top: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'التسجيل باستخدام أبل',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12), // مسافة بين النص والأيقونة
                        SvgPicture.asset(
                          'assets/icons/apple.svg', // مسار الأيقونة
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // مسافة بين الأزرار
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // عرض متجاوب
              height: 56,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8, // عرض متجاوب
                      height: 56,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF3C84F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    top: 15,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'التسجيل باستخدام جوجل',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'IBM Plex Sans Arabic',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 12), // مسافة بين النص والأيقونة
                        SvgPicture.asset(
                          'assets/icons/google.svg', // مسار الأيقونة
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // مسافة بين الأزرار
            Container(
              width: MediaQuery.of(context).size.width * 0.8, // Responsive width
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
        );
      },
    );
  }
}
