import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/configs/theme/dark_theme.dart';
import 'package:helper/configs/theme/light_theme.dart';
import 'package:helper/shared/root.dart';
import 'package:helper/services/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      child: MaterialApp(
        title: 'Helper',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        navigatorKey: navigatorKey,
        home: const Root(),
      ),
    );
  }
}
