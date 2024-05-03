import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle? headline;
  final TextStyle? body;
  final TextStyle? title;
  const AppTextTheme({
    this.headline,
    this.body,
    this.title,
  });

  AppTextTheme.light()
      : this(
          headline: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          body: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          title: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        );

  AppTextTheme.dark()
      : this(
          headline: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          body: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
          title: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        );

  @override
  ThemeExtension<AppTextTheme> copyWith({
    final TextStyle? headline,
    final TextStyle? body,
    final TextStyle? title,
  }) {
    return AppTextTheme(
      headline: headline ?? this.headline,
      body: body ?? this.body,
      title: title ?? this.title,
    );
  }

  @override
  AppTextTheme lerp(covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;
    return AppTextTheme(
      headline: TextStyle.lerp(headline, other.headline, t),
      body: TextStyle.lerp(body, other.body, t),
      title: TextStyle.lerp(title, other.title, t),
    );
  }
}
