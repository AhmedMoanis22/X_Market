import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:x_market/core/theme/colors.dart';
import 'package:x_market/core/utilits/widgets/transaction_text.dart';
import 'package:x_market/features/wallet/logic/wallet_cubit.dart';

import '../../../../core/routing/app_routes_name.dart';
import '../../../../core/utilits/widgets/custom_main_appbar.dart';
import '../../data/model/transction_model.dart';
import '../../logic/wallet_state.dart';
import '../widget/custom_transction_wallet_item.dart';
import '../widget/deposit_withdraw_option.dart';
import 'payment_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedType = 0;
  final List<String> types = [
    'الكل',
    'التمويل',
    'الاستثمار',
  ];

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return const DepositWithdrawOptions();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        final transactions = state.transactions;
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: const CustomWalletAppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  // خلفية المحفظة والرصيد
                  SizedBox(
                    height: screenHeight * 0.32,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/wallet_background.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'رصيد المحفظة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'ج.م 0.00',
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.025),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/icons/received.svg',
                                    ),
                                    label: const Text('سحب'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.2),
                                      foregroundColor: Colors.yellowAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const PaymentScreen()),
                                      );

                                      if (result != null &&
                                          result is TransactionModel) {
                                        context
                                            .read<WalletCubit>()
                                            .addTransaction(result);
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/icons/send.svg'),
                                    label: const Text('إيداع'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.white.withOpacity(0.2),
                                      foregroundColor: Colors.yellowAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                                onTap: () {
                                  Get.toNamed(AppRoutesName.transactionScreen);
                                },
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
                              'أحدث المعاملات',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'IBMPLEXSANSARABICBold',
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/frame.svg',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  transactions.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.13,
                              child:
                                  Image.asset('assets/images/emptyInbox.png'),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'معندكش أي معاملات جديدة حاليًا',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.gray,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            shrinkWrap: true,
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final tx = transactions[index];
                              return CustomTransctionWalletItem(tx: tx);
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
