import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/custom_login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('assets/icons/arrow_back.svg')),
          ),
        ],
      ),
      body: const Center(
        child: CustomLoginWidget(),
      ),
    );
  }
}
