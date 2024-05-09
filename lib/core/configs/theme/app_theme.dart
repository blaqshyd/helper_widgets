import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'app_theme_data.dart';

class AppTheme {
  AppTheme._();
  static ThemeData light = FlexThemeData.light(
    extensions: <ThemeExtension<dynamic>>[
      AppThemeData.light(),
      AppTextTheme.light()
    ],
    // colors: const FlexSchemeColor(
    //   primary: Color(0xff065808),
    //   primaryContainer: Color(0xff9ee29f),
    //   secondary: Color(0xff365b37),
    //   secondaryContainer: Color(0xffaebdaf),
    //   tertiary: Color(0xff2c7e2e),
    //   tertiaryContainer: Color(0xffb8e6b9),
    //   appBarColor: Color(0xffb8e6b9),
    //   error: Color(0xffb00020),
    // ),
    // usedColors: 2,
    // surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    // blendLevel: 7,
    // subThemesData: const FlexSubThemesData(
    //   useM2StyleDividerInM3: true,
    // ),
    // keyColors: const FlexKeyColors(
    //   useSecondary: true,
    //   keepPrimary: true,
    //   keepSecondary: true,
    //   keepPrimaryContainer: true,
    // ),
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // useMaterial3: true,
    // swapLegacyOnMaterial3: true,
    // fontFamily: GoogleFonts.ubuntu().fontFamily,
  );
  static ThemeData dark = FlexThemeData.dark(
    extensions: <ThemeExtension<dynamic>>[
      AppThemeData.dark(),
      AppTextTheme.dark()
    ],
    // colors: const FlexSchemeColor(
    //   primary: Color(0xff629f80),
    //   primaryContainer: Color(0xff274033),
    //   secondary: Color(0xff81b39a),
    //   secondaryContainer: Color(0xff4d6b5c),
    //   tertiary: Color(0xff88c5a6),
    //   tertiaryContainer: Color(0xff356c50),
    //   appBarColor: Color(0xff356c50),
    //   error: Color(0xffcf6679),
    // ),
    // usedColors: 2,
    // surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    // blendLevel: 13,
    // subThemesData: const FlexSubThemesData(
    //   useM2StyleDividerInM3: true,
    // ),
    // keyColors: const FlexKeyColors(
    //   useSecondary: true,
    // ),
    // visualDensity: FlexColorScheme.comfortablePlatformDensity,
    // useMaterial3: true,
    // swapLegacyOnMaterial3: true,
    // fontFamily: GoogleFonts.ubuntu().fontFamily,
  );
}
