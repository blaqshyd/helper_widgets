import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumberPlus on num {
  String get asCurrency => NumberFormat.currency(symbol: '\$').format(this);
  String get formatted => NumberFormat.decimalPattern().format(this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
  bool isBetween(num lower, num upper) => lower <= this && this <= upper;
}

extension WidgetExtensions on num {
  Widget get sbH => SizedBox(height: toDouble());
  Widget get sbW => SizedBox(width: toDouble());

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get padA => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry pad([
    num left = 0.0,
    num right = 0.0,
    num top = 0.0,
    num bottom = 0.0,
  ]) =>
      EdgeInsets.only(
        left: left.toDouble(),
        right: right.toDouble(),
        top: top.toDouble(),
        bottom: bottom.toDouble(),
      );
}
