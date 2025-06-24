import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../../../bussiness_logic/progress_indecator.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomHeadText(
                    text: 'الشروط والأحكام',
                  ),
                  SizedBox(height: 20),
                  CustomSubHeadText(
                    text:
                        'باستخدامك لتطبيق "ماركت إكس" ، فأنت توافق تلقائيًا ودون قيد أو شرط على جميع الشروط والأحكام التالية، ويُرجى قراءتها بعناية حيث أن استمرار استخدامك للخدمة يُعتبر قبولاً كاملاً لها.',
                  ),
                  SizedBox(height: 15),
                  Text(
                    ': أولاً: شروط استخدام الخدمة',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 10),
                  Text(
                    ' يجب أن يكون المستخدم عمره 18 سنة أو أكثر أو يملك إذن قانوني من ولي أمره أو وصيّه • يُسمح باستخدام التطبيق لأغراض شخصية فقط وغير تجارية • يُمنع استخدام التطبيق في أي نشاط غير قانوني أو مخالف للسياسات العامة ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'ثانيًا: إنشاء الحساب ومسؤولية المستخدم: • عند التسجيل، يتعهد المستخدم بإدخال بيانات صحيحة وحديثة ودقيقة • يتحمل المستخدم المسؤولية الكاملة عن الحفاظ على سرية اسم المستخدم وكلمة المرور الخاصة به وعدم مشاركتها مع أي طرف ثالث • تحتفظ إدارة ماركت إكس بالحق في تعليق أو إلغاء الحساب في حال اكتشاف نشاط مشبوه أو مخالف للشروط دون الحاجة لإشعار مسبق',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'ثالثًا: البيانات والأسعار المعروضة داخل التطبيق: • جميع البيانات المعروضة (بما في ذلك أسعار الأسهم وتحليلات السوق) يتم تقديمها لأغراض إعلامية فقط • لا تمثل هذه البيانات نصيحة استثمارية أو توصية بالشراء ',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'IBMPLEXSANSARABICRegular',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'أوافق على الشروط والأحكام',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'IBMPLEXSANSARABICRegular',
                    color: AppColors.Neutral,
                  ),
                  textAlign: TextAlign.right,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _agreed = !_agreed;
                    });
                  },
                  icon: Icon(
                    _agreed ? Icons.check_box : Icons.check_box_outline_blank,
                    color: _agreed ? AppColors.primaryGreen : Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  BlocBuilder<ProgressIndicatorCubit, double>(
                    builder: (context, progress) {
                      return LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.secondaryGreen,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _agreed
                          ? () {
                              context.read<ProgressIndicatorCubit>().nextStep();
                              Get.toNamed(
                                  AppRoutesName.profileCustomizationScreen);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _agreed
                            ? AppColors.primaryGreen
                            : Colors.grey.shade400,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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
            )
          ],
        ),
      ),
    );
  }
}
