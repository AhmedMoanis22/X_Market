import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:x_market/core/di/dependeny_injection.dart';
import 'package:x_market/features/home/bussiness_logic/stock_prediction_cubit.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/utilits/widgets/recommendation_stock_widget.dart';
import '../../../home/bussiness_logic/stock_prediction_state.dart';

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StockPredictionCubit>()..stockPrediction(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColors.primaryGreen,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: SafeArea(
              bottom: false,
              child: Container(
                color: AppColors.primaryGreen,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.moreGray,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.search, size: 20),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  '...ابحث',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'الأسهم',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'IBMPLEXSANSARABICBold',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        'assets/icons/arrow-square-right.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<StockPredictionCubit, StockPredictionState>(
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
                final predictions = state.stockPredictionResponse.predictions;
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final entry = predictions.entries.elementAt(index);
                        return RecommendationStockWidget(
                          prediction: entry,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount:
                          state.stockPredictionResponse.predictions.length),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
