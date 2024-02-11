import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TextFormats extends StatelessWidget {
  const TextFormats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [ThousandFormatter()],
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [AtmCardFormatter()],
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [PhoneNumberFormatter()],
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [DashFormatter()],
            ),
            TextField(
              // controller: textCtrl,
              maxLength: 11, // Set maximum length to 1
              keyboardType: TextInputType.number, // Set numeric keyboard
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NoInitialZeroFormatter()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThousandFormatter extends TextInputFormatter {
  final NumberFormat _numberFormat = NumberFormat.decimalPattern();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove non-digits and parse the input value
    String newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    int value = int.tryParse(newText) ?? 0;

    // Format the value using the NumberFormat
    String formattedValue = _numberFormat.format(value);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

class AtmCardFormatter extends TextInputFormatter {
  static const int maxCardLength = 16;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    if (cleanedText.length > maxCardLength) {
      cleanedText = cleanedText.substring(0, maxCardLength);
    }

    List<String> formattedChunks = [];

    for (int i = 0; i < cleanedText.length; i += 4) {
      int endIndex = i + 4;
      if (endIndex > cleanedText.length) {
        endIndex = cleanedText.length;
      }
      formattedChunks.add(cleanedText.substring(i, endIndex));
    }

    final String formattedText = formattedChunks.join(' ');

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String cleanedText =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    List<String> formattedChunks = [];

    for (int i = 0; i < cleanedText.length; i += 3) {
      formattedChunks.add(cleanedText.substring(i, i + 3));
    }

    final String formattedText = formattedChunks.join(' ');

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class DashFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Check if the last entered character is a space or dash
    if (newValue.text.isNotEmpty &&
        (newValue.text.endsWith('-') || newValue.text.endsWith(' ')) &&
        oldValue.text != newValue.text) {
      // Add ' - ' after the space or dash
      return TextEditingValue(
        text: '${newValue.text} - ',
        selection: TextSelection.collapsed(
          offset: newValue.text.length + 3,
        ),
      );
    }
    return newValue;
  }
}

class NoInitialZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith('0') && newValue.text.length > 1) {
      // Remove the leading zero
      return TextEditingValue(
        text: newValue.text.substring(1),
        selection: TextSelection.collapsed(
          offset: newValue.text.length - 1,
        ),
      );
    }
    return newValue;
  }
}
