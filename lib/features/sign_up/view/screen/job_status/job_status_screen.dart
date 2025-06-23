import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/theme/colors.dart';
import '../../../bussiness_logic/progress_indecator.dart';

class JobStatusScreen extends StatefulWidget {
  const JobStatusScreen({super.key});

  @override
  State<JobStatusScreen> createState() => _JobStatusScreenState();
}

class _JobStatusScreenState extends State<JobStatusScreen> {
  int? _selectedStatus;

  final List<String> statusOptions = [
    'أنا أعمل',
    'أنا متقاعد',
    'أنا أدرس',
    'أنا لا أعمل',
    'أنا أعمل لحسابي الخاص',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'الحالة الوظيفية',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'IBMPLEXSANSARABICBold',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'اختار الحالة الوظيفية ليك سواء انت موظف أو طالب أو متقاعد.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: AppColors.gray,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 40),
                  ...List.generate(
                    statusOptions.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          setState(() {
                            _selectedStatus = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _selectedStatus == index
                                  ? AppColors.primaryGreen
                                  : AppColors.Neutral,
                              width: 1.3,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: _selectedStatus == index
                                ? AppColors.secondaryGreen.withOpacity(0.2)
                                : Colors.white,
                          ),
                          child: Row(
                            children: [
                              Radio<int>(
                                value: index,
                                groupValue: _selectedStatus,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedStatus = value;
                                  });
                                },
                                activeColor: AppColors.primaryGreen,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  statusOptions[index],
                                  style: TextStyle(
                                    fontFamily: 'IBMPLEXSANSARABICRegular',
                                    fontSize:
                                        _selectedStatus == index ? 18 : 16,
                                    color: Colors.grey[700],
                                    fontWeight: _selectedStatus == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 12),
              child: Column(
                children: [
                  BlocBuilder<ProgressIndicatorCubit, double>(
                    builder: (context, progress) {
                      return LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 40, 53, 40)),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _selectedStatus != null
                          ? () {
                              Get.toNamed(
                                  AppRoutesName.terms_and_conditions_screen);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'التالي',
                        style: TextStyle(
                          fontFamily: 'IBMPLEXSANSARICBold',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
