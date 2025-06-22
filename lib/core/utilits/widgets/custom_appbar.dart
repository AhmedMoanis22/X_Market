import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_market/features/sign_up/bussiness_logic/Sign_up/sign_up_cubit.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              context.read<SignUpCubit>().updateProgress(-0.01);
            },
            child: SvgPicture.asset(
              'assets/icons/arrow_back.svg',
              width: 24.w, // Adjust width dynamically
              height: 24.h, // Adjust height dynamically
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
