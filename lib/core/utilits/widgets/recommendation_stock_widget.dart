import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/home/view/widget/recommendation_investment_company.dart';
import '../../routing/app_routes_name.dart';

class RecommendationStockWidget extends StatelessWidget {
  RecommendationStockWidget({super.key, required this.prediction});
  final MapEntry<String, double> prediction;
  final Map<String, String> stockLogos = {
    'ADBE': 'assets/svg/adobe.svg',
    'AMZN': 'assets/svg/amazon.svg',
    'AAPL': 'assets/svg/apple.svg',
    'MSFT': 'assets/svg/microsoft.svg',
    'GOOGL': 'assets/svg/google.svg',
    'TSLA': 'assets/svg/tesla.svg',
    'META': 'assets/svg/meta.svg',
    'NVDA': 'assets/svg/nvidia.svg',
    'NFLX': 'assets/svg/netflix.svg',
  };
  final Map<String, String> companyNames = {
    'ADBE': 'Adobe',
    'AMZN': 'Amazon',
    'AAPL': 'Apple',
    'MSFT': 'Microsoft',
    'GOOGL': 'Google',
    'TSLA': 'Tesla',
    'META': 'Meta',
    'NVDA': 'Nvidia',
    'NFLX': 'Netflix',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutesName.stocksProfileChart,
          arguments: {
            'stockName': companyNames[prediction.key] ?? prediction.key,
            'stockSymbol': prediction.key,
            'stockLogo': stockLogos[prediction.key] ?? 'assets/icons/apple.svg',
            'investmentAmount': prediction.value.toStringAsFixed(2),
          },
        );
      },
      child: RecommendationInvestmentCompany(
        image: stockLogos[prediction.key] ?? 'assets/icons/apple.svg',
        name: prediction.key,
        description: companyNames[prediction.key] ?? prediction.key,
        investmentAmount: '8.23%',
        investmentReturn: '${prediction.value.toStringAsFixed(2)} \$',
      ),
    );
  }
}
