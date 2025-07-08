import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomInvestmentType extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback? onTap;
  final Color? color;

  const CustomInvestmentType({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              imagePath,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
