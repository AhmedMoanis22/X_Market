import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../features/sign_up/bussiness_logic/progress_indecator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.backgroundColor});
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<ProgressIndicatorCubit>().previousStep();
            },
            child: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
