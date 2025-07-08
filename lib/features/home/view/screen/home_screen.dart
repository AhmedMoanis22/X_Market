import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_market/core/di/dependeny_injection.dart';
import 'package:x_market/features/home/bussiness_logic/stock_prediction_cubit.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utilits/widgets/recommendation_stock_widget.dart';
import '../../../sign_up/view/screen/profile_customization/ui/widget/investment_card_widget.dart';
import '../../../wallet/logic/wallet_cubit.dart';
import '../../../wallet/logic/wallet_state.dart';
import '../../bussiness_logic/stock_prediction_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
        create: (context) => getIt<StockPredictionCubit>()..stockPrediction(),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColors.primaryGreen,
            statusBarIconBrightness: Brightness.light,
          ),
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/svg/user.svg',
                  ),
                ),
                title: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '! عبدالرحمن',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'IBMPLEXSANSARABICSSemiBold'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'أهلا بيك',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'IBMPLEXSANSARABICSRegular'),
                    ),
                  ],
                ),
                actions: [
                  SvgPicture.asset(
                    'assets/icons/chart-2.svg',
                    height: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset(
                    'assets/icons/notification.svg',
                    height: 30,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: BlocBuilder<WalletCubit, WalletState>(
                    builder: (context, state) {
                  final transactions = state.transactions;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: '...ابحث',
                              border: InputBorder.none,
                              icon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      transactions.isEmpty
                          ? Center(
                              child: Image.asset(
                              'assets/images/groupp.png',
                              height: 100,
                              width: 300,
                              fit: BoxFit.fill,
                            ))
                          : const SizedBox.shrink(),
                      const InvestmentCard(
                        percentage: 0.1,
                        title: 'BTC \n صندوق بلتون مية مية ',
                        pngiconPath: 'assets/images/belton.png',
                        color: Colors.green,
                        fontFamily: 'IBMPLEXSANSARABICSRegular',
                        textColor: AppColors.gray,
                        investedAmount: 'تحب تستثمر؟',
                        payment: true,
                        isTrade: true,
                        isImageorText: Text('سعر آخر تداول \n 21.74 ج.م'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InvestmentCard(
                        percentage: 0.1,
                        title:
                            'تجربتك الاستثمارية جاهزة \n ادخل دلوقتي عشان تتعرف على تقسيمتك',
                        color: Colors.green,
                        fontFamily: 'IBMPLEXSANSARABICSRegular',
                        textColor: AppColors.gray,
                        investedAmount: 'الدخول للتجربة الاستمثارية الخاصة',
                        isTrade: false,
                        isImageorText:
                            SvgPicture.asset('assets/icons/invest_ready.svg'),
                        gradientBackground: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 244, 255, 240),
                            AppColors.secondaryGreen,
                          ],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      transactions.isEmpty
                          ? const SizedBox.shrink()
                          : BlocBuilder<StockPredictionCubit,
                              StockPredictionState>(builder: (context, state) {
                              if (state is StockPredictionLoading) {
                                return Column(
                                  children: List.generate(
                                    5,
                                    (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          height: 80,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: AppColors.Neutral),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              if (state is StockPredictionSuccess) {
                                final predictions =
                                    state.stockPredictionResponse.predictions;

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/setting_green.svg',
                                          height: 30,
                                          width: 30,
                                        ),
                                        const Spacer(),
                                        Text(
                                          'أعلى الرابحين يوميًا',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: AppColors.primaryGreen,
                                            fontFamily: 'IBMPLEXSANSARABICBold',
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        SvgPicture.asset(
                                          'assets/icons/investment.svg',
                                          color: AppColors.primaryGreen,
                                          height: 30,
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final entry = predictions.entries
                                            .elementAt(index);
                                        return RecommendationStockWidget(
                                          prediction: entry,
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(height: 10),
                                      itemCount: 3,
                                    ),
                                  ],
                                );
                              }
                              return const SizedBox.shrink();
                            }),
                    ],
                  );
                }),
              )),
        ),
      ),
    );
  }

  // ignore: unused_element
  Widget _buildStepItem(String iconPath, String label, bool isActive) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? const Color(0xFFFFF3C1) : const Color(0xFFEFEFEF),
            border: isActive
                ? Border.all(color: Colors.yellow[700]!, width: 2)
                : null,
          ),
          child: SvgPicture.asset(
            iconPath,
            height: 30,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
