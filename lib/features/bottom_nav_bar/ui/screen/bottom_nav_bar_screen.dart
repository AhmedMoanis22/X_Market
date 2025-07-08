import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/features/bottom_nav_bar/logic/bottom_nav_bar_cubit.dart';
import 'package:x_market/features/bottom_nav_bar/logic/bottom_nav_bar_state.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => BottomNavBarCubit(),
        child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
          builder: (context, state) {
            final cubit = context.read<BottomNavBarCubit>();

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(left: 25.0, bottom: 100.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      child: SvgPicture.asset(
                        'assets/icons/nouh.svg',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.startDocked,
                backgroundColor: Colors.white,
                extendBody: true,
                body: cubit.screen[cubit.currentIndex],
                bottomNavigationBar: CurvedNavigationBar(
                  index: cubit.currentIndex,
                  height: 70,
                  backgroundColor: Colors.transparent,
                  color: AppColors.primaryGreen,
                  buttonBackgroundColor: Colors.yellowAccent,
                  animationDuration: const Duration(milliseconds: 300),
                  items: List.generate(5, (index) {
                    final icons = [
                      'home.svg',
                      'wallet.svg',
                      'search.svg',
                      'investment.svg',
                      'more.svg',
                    ];

                    final labels = [
                      'الرئيسية',
                      'المحفظة',
                      'استكشف',
                      'البيانات',
                      'المزيد',
                    ];

                    final isSelected = cubit.currentIndex == index;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: SvgPicture.asset(
                            'assets/icons/${icons[index]}',
                            height: 30,
                            // ignore: deprecated_member_use
                            color: isSelected
                                ? AppColors.primaryGreen
                                : AppColors.moreGray,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isSelected ? '' : labels[index],
                          style: TextStyle(
                            fontSize: 10,
                            color: isSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    );
                  }),
                  onTap: (index) {
                    cubit.changeBottomState(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
