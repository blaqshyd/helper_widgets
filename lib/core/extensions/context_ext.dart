import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  NavigatorState get navigator => Navigator.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  FocusScopeNode get currentFocus => FocusScope.of(this);

  ScaffoldState get scaffoldState => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  bool get isInDarkMode => theme.brightness == Brightness.dark;

  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  SystemUiOverlayStyle get defaultSystemUiOverlayStyle {
    return SystemUiOverlayStyle(
      systemNavigationBarColor: theme.scaffoldBackgroundColor,
      systemNavigationBarIconBrightness: reverseBrightness,
      statusBarIconBrightness: reverseBrightness,
      statusBarColor: colorScheme.tertiary,
    );
  }

  Brightness get reverseBrightness => switch (isInDarkMode) {
        true => Brightness.dark,
        _ => Brightness.light,
      };

  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).width;

  // double dy(double value) => screenHeight * value / designHeight;
  // double dx(double value) => screenWidth * value / designWidth;

  void unfocus() => currentFocus.unfocus();

  // AppLocalizations get l10n => AppLocalizations.of(this)!;

  Future<T?> showBottomSheet<T>({
    required WidgetBuilder builder,
    double? borderRadius,
    bool? isScrolled,
  }) {
    return showModalBottomSheet<T>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius ?? 40.0),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      isScrollControlled: isScrolled ?? false,
      useRootNavigator: true,
      builder: builder,
      context: this,
    );
  }
}
