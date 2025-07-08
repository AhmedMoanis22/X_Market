import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_market/core/routing/app_routes_name.dart';

import '../../../../core/di/dependeny_injection.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utilits/widgets/custom_main_appbar.dart';
import '../../../../core/utilits/widgets/recommendation_stock_widget.dart';
import '../../../home/bussiness_logic/stock_prediction_cubit.dart';
import '../../../home/bussiness_logic/stock_prediction_state.dart';
import '../widget/custom_investment_type.dart';
import '../widget/explore_feature.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocProvider(
        create: (context) => getIt<StockPredictionCubit>()..stockPrediction(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const CustomWalletAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomInvestmentType(
                        color: AppColors.lightblue2,
                        imagePath: 'assets/svg/financy.svg',
                        title: 'العملات المعدنيه',
                        description: '16 استكشاف',
                      ),
                      const CustomInvestmentType(
                        color: AppColors.lightRed,
                        imagePath: 'assets/svg/const_income.svg',
                        title: 'الدخل الثابت',
                        description: '7 استكشاف',
                      ),
                      const CustomInvestmentType(
                        color: AppColors.lightblue,
                        imagePath: 'assets/icons/gold.svg',
                        title: 'صناديق الذهب',
                        description: '3 توصيات',
                      ),
                      CustomInvestmentType(
                        color: AppColors.lightYellow,
                        imagePath: 'assets/svg/stocks.svg',
                        title: 'الأسهم',
                        description: '260 استكشاف',
                        onTap: () {
                          Get.toNamed(AppRoutesName.stockPrediction);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 75,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'عرض الكل',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'قوائم ماركت إكس',
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'IBMPLEXSANSARABICBold'),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        'assets/icons/marketx.svg',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2 * 60,
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 2.5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: const [
                        ExploreFeature(
                          text: 'الذهب',
                          imagePath: 'assets/icons/explore1.svg',
                        ),
                        ExploreFeature(
                          text: 'الوزعون',
                          imagePath: 'assets/icons/explore2.svg',
                        ),
                        ExploreFeature(
                          text: 'صناديق الاستثمار',
                          imagePath: 'assets/icons/explore3.svg',
                        ),
                        ExploreFeature(
                          text: 'مؤشر EGX30',
                          imagePath: 'assets/icons/explore4.svg',
                        ),
                        ExploreFeature(
                          text: 'مؤشر EGX70 EWI',
                          imagePath: 'assets/icons/explore5.svg',
                        ),
                        ExploreFeature(
                          text: 'متوافق مع الشريعة',
                          imagePath: 'assets/icons/explore5.svg',
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<StockPredictionCubit, StockPredictionState>(
                      builder: (context, state) {
                    if (state is StockPredictionLoading) {
                      return Column(
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                height: 80,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColors.Neutral),
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
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final entry =
                                  predictions.entries.elementAt(index);
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
