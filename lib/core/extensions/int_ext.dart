extension IntExtensions on int {
  String formatAmount() {
    String amountStr = toString();
    if (amountStr.length <= 3) {
      return amountStr;
    }
    String formattedAmount = '';
    int commaPos = amountStr.length % 3;

    if (commaPos == 0) {
      commaPos = 3;
    }

    formattedAmount += amountStr.substring(0, commaPos);

    while (commaPos < amountStr.length) {
      formattedAmount += ',${amountStr.substring(commaPos, commaPos + 3)}';
      commaPos += 3;
    }

    return formattedAmount;
  }

  String get formatAmt {
    String amountStr = toString();
    if (amountStr.length <= 3) {
      return amountStr;
    }
    String formattedAmount = '';
    int commaPos = amountStr.length % 3;

    if (commaPos == 0) {
      commaPos = 3;
    }

    formattedAmount += amountStr.substring(0, commaPos);

    while (commaPos < amountStr.length) {
      formattedAmount += ',${amountStr.substring(commaPos, commaPos + 3)}';
      commaPos += 3;
    }

    return formattedAmount;
  }

  String get asLongTimeString => '$seconds'.split('.').first.padLeft(8, '0');
  String get asShortTimeString => asLongTimeString.substring(3);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);



  
}
