import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:x_market/core/utilits/widgets/custom_appbar.dart';

import '../../../../../core/helper/custom_text_button.dart';
import '../../../bussiness_logic/Sign_up/sign_up_cubit.dart';
import '../../../bussiness_logic/progress_indecator.dart';
import '../../widget/custom_text_for_identification.dart';
import '../../widget/sign_up_in_marketx_title.dart';
import '../pin_code/create_pincode_screen.dart';

class CountrySelectionScreen extends StatefulWidget {
  const CountrySelectionScreen({super.key});

  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;
  String? selectedNationality;

  void _pickCountry(bool isNationality) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() {
          if (isNationality) {
            selectedNationality = "${country.flagEmoji} ${country.name}";
          } else {
            selectedCountry = "${country.flagEmoji} ${country.name}";
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const SignUpInMarketxTitle(),
                    const SizedBox(height: 45),
                    const CustomTextForIdentification(
                      text: "عايش فين؟",
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _pickCountry(false),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.keyboard_arrow_down_rounded),
                            Expanded(
                              child: Text(
                                selectedCountry ??
                                    "الدولة اللي انت قاعد فيها دلوقتي",
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const CustomTextForIdentification(
                      text: 'جنسيتك ايه؟',
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => _pickCountry(true),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.keyboard_arrow_down_rounded),
                            Expanded(
                              child: Text(
                                selectedNationality ??
                                    "الدولة اللي اتولدت فيها",
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ProgressIndecator, double>(
              builder: (context, progress) {
                return LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomTextButton(
              onPressed: () {
                if (selectedCountry == null || selectedNationality == null) {
                  Fluttertoast.showToast(
                    msg: 'يرجى تحديد الدولة والجنسية',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                  return;
                }

                context.read<ProgressIndecator>().updateProgress(0.3);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                            value: context.read<ProgressIndecator>()),
                        BlocProvider.value(value: context.read<SignUpCubit>()),
                      ],
                      child: const CreatePincodeScreen(),
                    ),
                  ),
                );
              },
              text: 'التالي',
            ),
          ],
        ),
      ),
    );
  }
}
