import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:x_market/core/routing/app_routes_name.dart';
import 'package:x_market/features/onboarding/data/model/onboarding_model.dart';
import '../../../../core/theme/colors.dart';
import 'custom_item_onboarding_widget.dart';

class CustomOnboardingWidget extends StatefulWidget {
  const CustomOnboardingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomOnboardingWidgetState createState() => _CustomOnboardingWidgetState();
}

class _CustomOnboardingWidgetState extends State<CustomOnboardingWidget> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> onboardingList = [
    OnboardingModel(
      title: 'محفظة بأمان عالي جدًا تقدر من خلالها تدير معاملاتك.',
      description:
          'تقدر تشحن محفظتك وتستثمر فلوسك وتسحب \nالأرباح بكل سهولة، وتتابع كل معاملاتك المالية مع \nأنظمة أمان وخصوصية على أعلى مستوى',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingModel(
      title: 'تتبع لحظي لأسعار الأسهم\n مع نظام اشعارات خاص بك',
      description:
          'تقدر تتابع أسهم معينة بنرشحهالك مخصوص حسب \nاهتماماتك الاستثمارية، وكمان بنبعتلك اشعارات لو \nحصل أي تغير مهم أو أي خبر يأثر على حركة السهم.',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingModel(
      title: 'مدعوم بالذكاء الاصطناعي  \nلترشيح أفضل الخيارات لك',
      description:
          'ترشيحات للأسهم اللي تناسب اهتماماتك المالية مع تحليل \nدقيق لقوة السهم حسب المعطيات السوقية، بالإضافة \nلمساعد ذكي موجود معك في كل مكان في التطبيق',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: onboardingList.length,
            itemBuilder: (context, index) {
              return CustomItemOnboardingWidget(
                onboardingModel: onboardingList[index],
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: _controller,
          count: onboardingList.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: AppColors.primaryGreen,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (currentIndex == onboardingList.length - 1) {
                    Get.toNamed(AppRoutesName.login_in);
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.primaryGreen,
                    ),
                    Text(
                      currentIndex == onboardingList.length - 1
                          ? "تسجيل"
                          : "التالي",
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryGreen,
                          fontFamily: 'IBMPLEXSANSARABICBold'),
                    ),
                  ],
                ),
              ),
              currentIndex == onboardingList.length - 1
                  ? Container()
                  : TextButton(
                      onPressed: () {
                        _controller.jumpToPage(onboardingList.length - 1);
                      },
                      child: const Text(
                        "تخطي",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: 'IBMPLEXSANSARABICBold'),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
