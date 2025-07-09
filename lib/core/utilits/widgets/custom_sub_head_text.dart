import 'package:flutter/widgets.dart';

import '../../theme/colors.dart';

class CustomSubHeadText extends StatelessWidget {
  const CustomSubHeadText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 18,
          fontFamily: 'IBMPLEXSANSARABICRegular',
          color: AppColors.gray),
      textAlign: TextAlign.right,
    );
  }
}
