import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/colors.dart';

class RecommendationInvestmentCompany extends StatelessWidget {
  const RecommendationInvestmentCompany(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      required this.investmentAmount,
      required this.investmentReturn});
  final String image;
  final String name;
  final String description;
  final String investmentAmount;
  final String investmentReturn;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.Neutral,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                image,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBMPLEXSANSARABICSemiBold',
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.secondaryGreen,
                      ),
                      Text(
                        investmentAmount,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'IBMPLEXSANSARABICRegular',
                            color: AppColors.secondaryGreen),
                      ),
                    ],
                  ),
                  Text(
                    investmentReturn,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'IBMPLEXSANSARABICRegular',
                        color: Colors.black),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
