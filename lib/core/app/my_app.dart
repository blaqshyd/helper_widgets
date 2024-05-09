import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:helper/core/configs/theme/app_theme.dart';
import 'package:helper/shared/screens/root.dart';
import 'package:helper/shared/shared.dart';
import 'package:toastification/toastification.dart';

import '../index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Globals.designSize,
      useInheritedMediaQuery: true,
      child: ToastificationWrapper(
        child: MaterialApp(
          title: Globals.appTitle,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          navigatorKey: navigatorKey,
          home: const Root(),
        ),
      ),
    );
  }
}
