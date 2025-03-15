import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpInMarketxTitle extends StatelessWidget {
  const SignUpInMarketxTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'إنشاء حساب في ماركت إكس',
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: 'IBMPLEXSANSARABICBold',
        ),
      ),
    );
  }
}
