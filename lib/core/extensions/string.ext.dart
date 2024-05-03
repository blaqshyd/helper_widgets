import 'package:flutter/material.dart';
import 'package:helper/core/utils/regex.dart';
import 'package:intl/intl.dart';

/// This extension is on [String]
extension StringExtension on String {
  /// parses a [String] to an [int]
  int get toInt => int.parse(this);

  /// parses a [String] to an [DateTime]
  DateTime get toDateTime => DateTime.parse(this);

  /// Capitalizes a [String]
  String get capitalize => substring(0, 1).toUpperCase() + substring(1);

  String get toCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get capitalizeFirst {
    if (isEmpty) return "";
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get getInitials {
    List<String> nameParts = split(' ');
    String initials = '';

    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0].toUpperCase();
      }
    }
    return initials;
  }

  String get emailPrefix {
    List<String> parts = split('@');
    if (parts.length > 1) {
      return parts[0].capitalize;
    }
    return capitalize;
  }

  /// or
  /// * Return a default string if the intial string is empty
  ///
  String or(String other) => isEmpty ? other : this;

  /// take
  /// * Return only specified chars of length
  ///
  String take(int chars) => substring(0, chars.clamp(0, length));

  bool get isValidPassword => length >= 8;

  bool get isValidReferralCode => length == 6;

  bool get isValidEmail => RegExp(emailPattern3).hasMatch(this);

  bool get isValidUsername => RegExp(r'^[A-Za-z]{2,}$').hasMatch(this);

  String get capitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String get titleCased =>
      split(RegExp(r' +')).map((part) => part.capitalized).join(' ');

  String? get camelCase => toBeginningOfSentenceCase(this);
  String? get trimToken => contains(":") ? split(":")[1].trim() : this;
  String? get trimSpaces => replaceAll(" ", "");
  String? get removeSpacesAndLower => replaceAll(' ', '').toLowerCase();

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized)
      .join(' ');

  Text txt({
    double? fontSize,
    double? height,
    Color? color,
    Color? decorationColour,
    TextDecorationStyle? decorationStyle,
    FontWeight? fontWeight,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? overflow,
    TextDecoration? decoration,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      this,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        decorationColor: decorationColour,
        decorationStyle: decorationStyle,
        decoration: decoration,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        overflow: overflow,
        height: height,
        color: color,
      ),
    );
  }
}

extension ImagePath on String {
  String get png => 'assets/images/$this.png';
  String get jpg => 'assets/images/$this.jpg';
  String get gif => 'assets/images/$this.gif';
}

extension VectorPath on String {
  String get svg => 'assets/vectors/$this.svg';
  String get iconSvg => 'assets/icons/$this.svg';
  String get iconImg => 'assets/icons/$this.png';
}

extension ImageExtension on String {
  Image imgAsset({
    required double? h,
    BoxFit? fit,
  }) {
    return Image.asset(
      this,
      height: h,
      fit: fit,
    );
  }

  Image imgNet({
    required double? h,
    BoxFit? fit,
  }) {
    return Image.network(
      this,
      height: h,
      fit: fit,
    );
  }

  AssetImage get assetImg => AssetImage(this);
  NetworkImage get netImg => NetworkImage(this);
}
