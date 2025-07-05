import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_market/features/sign_up/bussiness_logic/progress_indecator.dart';

class CustomHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;

  const CustomHomeAppbar({
    super.key,
    this.backgroundColor,
    this.leading,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: leading,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null)
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: title!,
              ),
            ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<ProgressIndicatorCubit>().previousStep();
            },
            child: SvgPicture.asset(
              'assets/svg/arrow-square-right.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
