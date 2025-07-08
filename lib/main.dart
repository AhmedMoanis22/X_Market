import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_market/features/sign_up/bussiness_logic/Sign_up/sign_up_cubit.dart';
import 'core/di/dependeny_injection.dart';
import 'core/routing/app_routes_configurations.dart';
import 'core/utilits/classes/bloc_observer.dart';
import 'features/sign_up/bussiness_logic/progress_indecator.dart';
import 'features/wallet/data/model/transction_model.dart';
import 'features/wallet/logic/wallet_cubit.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox<TransactionModel>('transactions');
  Bloc.observer = MyBlocObserver();
  await setupGetit();
  runApp(const MyApp());
}
// This line is used to remove the native splash screen after the app has loaded.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WalletCubit()),
        BlocProvider(
            create: (context) => ProgressIndicatorCubit(totalSteps: 14)),
        BlocProvider(create: (context) => getIt<SignUpCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            getPages: routes,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
