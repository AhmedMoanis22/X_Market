import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreFeature extends StatelessWidget {
  final String text;
  final String imagePath;

  const ExploreFeature({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 60,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            SvgPicture.asset(
              imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
