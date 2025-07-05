import 'package:flutter/material.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/custom_home_appbar.dart';
import 'package:x_market/core/utilits/widgets/transaction_text.dart';
import 'package:x_market/features/wallet/ui/widget/deposit_withdraw_option.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return DepositWithdrawOptions();
      },
    );
  }

  int selectedType = 0;
  String selectedFilter = 'ايداع';

  final List<String> filters = ['سحب', 'ايداع'];
  final List<String> types = [
    'الكل',
    'المكتمل',
    'قيد الانتظار',
    'تحت التنفيذ',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHomeAppbar(
        title: const Text(
          'أحدث المعاملات',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'IBMPLEXSANSARABICRegular',
          ),
        ),
        backgroundColor: AppColors.primaryGreen,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
              ),
            ),
            TextButton(
              onPressed: (
              ) => _showBottomSheet(context),
              child:  const Text(
                'إيداع',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],

        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.02,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        types.length,
                        (i) => Padding(
                          padding: EdgeInsets.only(left: i == 0 ? 0 : 8),
                          child: TransactionText(
                            text: types[types.length - 1 - i],
                            selected: selectedType == types.length - 1 - i,
                            onTap: () {
                              setState(() {
                                selectedType = types.length - 1 - i;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.18,
                        child: Image.asset(
                          'assets/images/emptyInbox.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'معندكش أي معاملات حاليا',
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'IBMPLEXSANSARABICSRegular',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
