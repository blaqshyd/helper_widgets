import 'package:flutter/material.dart';

class Globals {
  static bool isDev = true;

  static String get env => isDev ? 'dev' : 'prod';

  static String get appName => 'Helper';

  static String get appTitle => appName;

  static Size get designSize => const Size(375, 725);
}
