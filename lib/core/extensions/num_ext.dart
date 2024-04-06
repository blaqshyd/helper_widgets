import 'package:intl/intl.dart';

extension NumberPlus on num {
  String get asCurrency => NumberFormat.currency(symbol: '').format(this);
  String get formatted => NumberFormat.decimalPattern().format(this);

  bool isBetween(num lower, num upper) => lower <= this && this <= upper;
}
