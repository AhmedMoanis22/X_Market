import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28.sp,
          fontFamily: 'IBMPLEXSANSARABICBold',
        ),
      ),
    );
  }
}
