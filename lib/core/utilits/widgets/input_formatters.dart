import 'package:flutter/services.dart';

/// Formatter to format card numbers as `0000 0000 0000 0000`
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      if ((i + 1) % 4 == 0 && i != newText.length - 1) {
        buffer.write(' ');
      }
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

/// Formatter to format expiry dates as `MM/YY`
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (newText.length >= 3) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    if (newText.length > 5) {
      newText = newText.substring(0, 5);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
