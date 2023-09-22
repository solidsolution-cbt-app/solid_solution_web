import 'package:flutter/services.dart';

class NumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove any non-numeric characters from the new value
    final sanitizedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    return TextEditingValue(
      text: sanitizedText,
      selection: TextSelection.collapsed(offset: sanitizedText.length),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  CardNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    if (newText.length > 4 && newText.substring(4, 5) != '-') {
      newText = "${newText.substring(0, 4)}-${newText.substring(4)}";
    }
    if (newText.length > 9 && newText.substring(9, 10) != '-') {
      newText = "${newText.substring(0, 9)}-${newText.substring(9)}";
    }
    if (newText.length > 14 && newText.substring(14, 15) != '-') {
      newText = "${newText.substring(0, 14)}-${newText.substring(14)}";
    }
    if (newText.length > 19) {
      return TextEditingValue(
        text: newText.substring(0, 19),
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CardDateFormatter extends TextInputFormatter {
  CardDateFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    if (newText.length > 2 && newText.substring(2, 3) != ' ') {
      newText = "${newText.substring(0, 2)} / ${newText.substring(2)}";
    }
    if (newText.length > 7) {
      return TextEditingValue(
        text: newText.substring(0, 5),
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
