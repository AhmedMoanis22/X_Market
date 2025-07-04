import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/screen/home_screen.dart';
import '../../wallet/ui/screen/wallet_screen.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavInitial());

  int currentIndex = 0;
  List<Widget> screen = [
    const HomeScreen(),
    const WalletScreen(),
    const Column(children: [
      Text('استكشف'),
    ]),
    const Column(children: [
      Text('البيانات'),
    ]),
    const Column(children: [
      Text('المزيد'),
    ]),
  ];
  void changeBottomState(int index) {
    currentIndex = index;
    emit(BottomNavSuccess());
  }
}
