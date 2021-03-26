import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NumericTextFormatter extends TextInputFormatter {
  final int numOfInteger;
  final int decimals;

  NumericTextFormatter({this.numOfInteger = 3, this.decimals = 0});
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      if (newValue.text.replaceAll(RegExp("[0-9.,]"), '').isNotEmpty) {
        return newValue = oldValue;
      }
      final newString = formatCurrencyForeign(newValue.text,
          numOfInteger: numOfInteger, decimals: decimals);

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length),
      );
    } else {
      return newValue;
    }
  }
}

double? formatNumberCurrency(String text) {
  if (text.isEmpty) return 0;
  return double.tryParse(text.replaceAll(',', ''));
}

String formatCurrencyForeign(dynamic number,
    {int numOfInteger = 3, int decimals = 0}) {
  String first = number.toString().substring(
      0,
      number.toString().contains('.')
          ? number.toString().lastIndexOf('.')
          : null);
  final int firstNumber = numOfInteger +
      ((numOfInteger % 3 != 0) ? numOfInteger ~/ 3 : ((numOfInteger ~/ 3) - 1));
  if (first.length >= firstNumber) {
    first = first.substring(0, firstNumber);
  }
  String last = number.toString().substring(
      number.toString().contains('.')
          ? number.toString().lastIndexOf('.')
          : number.toString().length,
      number.toString().length);
  if (last.length >= decimals + 2) {
    last = last.substring(0, decimals + 1);
  }
  final String result =
      NumberFormat.currency(locale: 'en_US', symbol: '', decimalDigits: 0)
              .format(formatNumberCurrency(first))
              .trim() +
          last;
  return result;
}
