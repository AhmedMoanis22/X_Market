import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithGoogleOrApple extends StatelessWidget {
  const LoginWithGoogleOrApple(
      {super.key,
      required this.tiltle,
      required this.color,
      required this.icon});
  final String tiltle;
  final Color color;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            tiltle,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'IBMPLEXSANSARABICBold',
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(icon),
        ]),
      ),
    );
  }
}
