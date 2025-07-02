import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../../../core/theme/colors.dart';
import '../../../../../../../core/utilits/widgets/custom_head_text.dart';
import '../../../../../../../core/utilits/widgets/custom_sub_head_text.dart';
import '../../data/model/question_model.dart';

class ProfileCustomizationQuestions extends StatefulWidget {
  const ProfileCustomizationQuestions({super.key});

  @override
  State<ProfileCustomizationQuestions> createState() =>
      _ProfileCustomizationQuestionsState();
}

class _ProfileCustomizationQuestionsState
    extends State<ProfileCustomizationQuestions> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<int?> answers = List<int?>.filled(4, null);

  final List<QuestionModel> questions = [
    const QuestionModel(
      head: 'عايز أستثمر عشان..',
      subHead: 'اختار الاختيار اللي يناسب أهدافك من الخيارات دول\nسؤال 1/4',
      options: [
        'أحتفظ على فلوسي من التضخم.',
        'أزود من قيمة فلوسي.',
      ],
      image: 'assets/images/profile_cus1.png',
    ),
    const QuestionModel(
      head: 'بالنسبة للمخاطرة..',
      subHead: 'اختار الاختيار اللي يناسب أهدافك من الخيارات دول\nسؤال 2/4',
      options: [
        'ممكن أخاطر لو في عوائد على المدى البعيد.',
        'لا بحبش المخاطرة، بفضل المكسب المضمون.',
      ],
      image: 'assets/images/profile_cus2.png',
    ),
    const QuestionModel(
      head: 'محتاج الفلوس دي حاليًا..',
      subHead: 'اختار الاختيار اللي يناسب أهدافك من الخيارات دول\nسؤال 3/4',
      options: [
        'آه غالبًا محتاجها في وقت قريب.',
        'لأ دي فلوس زيادة مش محتاجها في وقت قريب.',
      ],
      image: 'assets/images/profile_cus3.png',
    ),
    const QuestionModel(
      head: 'ايه الأحسن بالنسبالك..',
      subHead: 'اختار الاختيار اللي يناسب أهدافك من الخيارات دول\nسؤال 4/4',
      options: [
        'أزود فلوسي بنسبة 50% خلال 6 شهور.',
        'أزود فلوسي بنسبة 100% خلال سنة واحدة.',
      ],
      image: 'assets/images/profile_cus4.png',
    ),
  ];

  void _nextPage() {
    if (_currentIndex < questions.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
    } else {
      Get.toNamed(AppRoutesName.profileCustomizationResultScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              onPageChanged: (i) {
                setState(() {
                  _currentIndex = i;
                });
              },
              itemBuilder: (context, pageIndex) {
                final q = questions[pageIndex];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 40.h),
                      CustomHeadText(text: q.head),
                      SizedBox(height: 10.h),
                      CustomSubHeadText(
                        text: q.subHead,
                      ),
                      SizedBox(height: 20.h),
                      ...List.generate(
                        q.options.length,
                        (optionIndex) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.r),
                            onTap: () {
                              setState(() {
                                answers[pageIndex] = optionIndex;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: answers[pageIndex] == optionIndex
                                      ? AppColors.primaryGreen
                                      : AppColors.Neutral,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(12.r),
                                color: answers[pageIndex] == optionIndex
                                    ? AppColors.secondaryGreen.withOpacity(0.2)
                                    : Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Radio<int>(
                                    value: optionIndex,
                                    groupValue: answers[pageIndex],
                                    onChanged: (value) {
                                      setState(() {
                                        answers[pageIndex] = value;
                                      });
                                    },
                                    activeColor: AppColors.primaryGreen,
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      q.options[optionIndex],
                                      style: TextStyle(
                                        fontFamily: 'IBMPLEXSANSARABICRegular',
                                        fontSize:
                                            answers[pageIndex] == optionIndex
                                                ? 18.sp
                                                : 16.sp,
                                        color: Colors.grey[700],
                                        fontWeight:
                                            answers[pageIndex] == optionIndex
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
                      SizedBox(height: 12.h),
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            q.image,
                            fit: BoxFit.contain,
                            height: 170,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: answers[_currentIndex] != null ? _nextPage : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  _currentIndex == questions.length - 1 ? "إنهاء" : "التالي",
                  style: const TextStyle(
                    fontFamily: 'IBMPLEXSANSARABICBold',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
