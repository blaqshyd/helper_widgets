import 'package:flutter/material.dart';

import 'app_text_theme.dart';

class AppThemeData extends ThemeExtension<AppThemeData> {
  final AppTextTheme? textTheme;
  final Color? bgColor;
  final Color? cardColor;
  AppThemeData({
    this.textTheme,
    this.bgColor,
    this.cardColor,
  });

  AppThemeData.light()
      : this(
          bgColor: Colors.white,
          cardColor: Colors.white,
          textTheme: AppTextTheme.light(),
        );

  AppThemeData.dark()
      : this(
          bgColor: Colors.black,
          cardColor: Colors.black,
          textTheme: AppTextTheme.dark(),
        );

  @override
  ThemeExtension<AppThemeData> copyWith({
    final AppTextTheme? textTheme,
    final Color? bgColor,
    final Color? cardColor,
  }) {
    return AppThemeData(
      textTheme: textTheme ?? this.textTheme,
      bgColor: bgColor ?? this.bgColor,
      cardColor: cardColor ?? this.cardColor,
    );
  }

  @override
  ThemeExtension<AppThemeData> lerp(
      covariant ThemeExtension<AppThemeData>? other, double t) {
    if (other is! AppThemeData) return this;
    return AppThemeData(
      bgColor: Color.lerp(bgColor, other.bgColor, t),
      cardColor: Color.lerp(cardColor, other.cardColor, t),
      textTheme: textTheme?.lerp(other.textTheme, t),
    );
  }
}
