import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:x_market/core/routing/app_routes_name.dart';

// ignore: use_key_in_widget_constructors
class DepositWithdrawOptions extends StatefulWidget {
  @override
  State<DepositWithdrawOptions> createState() => _DepositWithdrawOptionsState();
}

class _DepositWithdrawOptionsState extends State<DepositWithdrawOptions> {
  String selected = 'الإيداع';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            value: 'الإيداع',
            groupValue: selected,
            onChanged: (val) => setState(() => selected = val!),
            title: const Text('الإيداع'),
          ),
          RadioListTile<String>(
            value: 'السحب',
            groupValue: selected,
            onChanged: (val) => setState(() => selected = val!),
            title: const Text('السحب'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutesName.paymentScreen);
            },
            // ignore: sort_child_properties_last
            child: const Text('تأكيد'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ),
    );
  }
}
