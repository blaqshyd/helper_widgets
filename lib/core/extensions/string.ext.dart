import 'package:flutter/material.dart';

/// This extension is on [String]
extension StringExtension on String {
  /// parses a [String] to an [int]
  int get toInt => int.parse(this);

  /// Capitalizes a [String]
  String get capitalize {
    return substring(0, 1).toUpperCase() + substring(1);
  }

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

  Text txt({
    double? fontSize,
    Color? color,
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
        fontSize: fontSize ?? 14,
        color: color,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        decoration: decoration,
      ),
    );
  }
}
