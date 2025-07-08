import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';

class CustomWalletAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomWalletAppBar({super.key, this.backgroundcolor});
  final Color? backgroundcolor;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primaryGreen,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          color: backgroundcolor ?? AppColors.primaryGreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // user icon
              SvgPicture.asset(
                'assets/svg/user.svg',
                height: 28,
              ),
              const SizedBox(width: 6),

              // Search box
              Expanded(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.moreGray,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: '...ابحث',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // chart icon
              SvgPicture.asset(
                'assets/icons/chart-2.svg',
                height: 28,
                color: Colors.white,
              ),
              const SizedBox(width: 10),

              // notification icon
              SvgPicture.asset(
                'assets/icons/notification.svg',
                height: 28,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
