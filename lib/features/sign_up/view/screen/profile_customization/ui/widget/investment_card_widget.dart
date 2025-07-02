import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvestmentCard extends StatelessWidget {
  final double percentage;
  final String title;
  final String iconPath;
  final Color color;
  final String? fontFamily;
  final Color? textColor;
  final String? investedAmount; // 🆕 المبلغ الاختياري

  const InvestmentCard({
    super.key,
    required this.percentage,
    required this.title,
    required this.iconPath,
    required this.color,
    this.fontFamily,
    this.textColor,
    this.investedAmount, // 🆕
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: percentage),
      duration: const Duration(seconds: 2),
      builder: (context, value, _) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: value,
                            strokeWidth: 6,
                            backgroundColor: Colors.grey[200],
                            color: color,
                          ),
                          Center(
                            child: Text(
                              '${(value * 100).toInt()}%',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: fontFamily ?? 'IBMPLEXSANSARABICBold',
                            color: textColor ?? Colors.black,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(width: 16),
                        SvgPicture.asset(iconPath, height: 30, width: 30),
                      ],
                    ),
                  ],
                ),
              ),

              if (investedAmount != null)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.arrow_back_ios,
                          size: 16, color: Colors.grey),
                      Text(
                        'استثمر $investedAmount ج.م',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
