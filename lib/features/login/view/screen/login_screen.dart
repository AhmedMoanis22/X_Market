import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';
import '../widget/email_and_password.dart';
import '../widget/login_with_google_or_apple.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white.withOpacity(0.5),
            automaticallyImplyLeading: false,
            floating: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/arrow_back.svg'),
                ),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '!أهلا بيك في ماركت إكس',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'التسجيل من خلال جوجل أو أبل',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                          color: AppColors.gray,
                        ),
                      ),
                      SizedBox(height: 20),
                      LoginWithGoogleOrApple(
                        tiltle: 'التسجيل باستخدام أبل',
                        color: Colors.black,
                        icon: 'assets/icons/apple.svg',
                      ),
                      SizedBox(height: 20),
                      LoginWithGoogleOrApple(
                        tiltle: 'التسجيل باستخدام جوجل',
                        color: AppColors.brightBlue,
                        icon: 'assets/icons/google.svg',
                      ),
                      SizedBox(height: 20),
                      Divider(),
                      SizedBox(height: 20),
                      Text(
                        'تسجيل الدخول بحسابك',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'IBMPLEXSANSARABICBold',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      EmailAndPassword(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
