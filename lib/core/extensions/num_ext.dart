import 'package:intl/intl.dart';

extension NumberPlus on num {
  String get asCurrency => NumberFormat.currency(symbol: '').format(this);
  String get formatted => NumberFormat.decimalPattern().format(this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
  bool isBetween(num lower, num upper) => lower <= this && this <= upper;
}
