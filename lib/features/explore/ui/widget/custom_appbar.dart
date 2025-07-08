import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class CustomExploreAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomExploreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: preferredSize.height,
        color: AppColors.primaryGreen,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Text & back icon
            Row(
              children: [
                const Text(
                  'الأسهم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'IBMPLEXSANSARABICBold',
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),

            // Search bar
            Expanded(
              flex: 3,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.moreGray,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '...ابحث',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 👇 هنا لازم نعرف الحجم الافتراضي للـ appBar
  @override
  Size get preferredSize => const Size.fromHeight(80);
}
