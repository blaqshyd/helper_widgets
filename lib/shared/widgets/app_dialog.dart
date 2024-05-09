import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/index.dart';
import 'package:helper/shared/shared.dart';

class AppDialog {
  AppDialog();
  //! Dialog with header and default

  AppDialog.normalDialog({
    String? dialogText,
    String? dialogHeader,
    String? btnText,
    Color? barrierColor,
    VoidCallback? onTap,
  }) {
    showDialog(
      barrierColor: barrierColor ?? Colors.grey,
      barrierDismissible: kDebugMode,
      context: navigatorKey.currentContext!,
      builder: (context) => SimpleDialog(
        title: Text(dialogHeader ?? 'Dialog Header'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(8),
        children: [
          SimpleDialogOption(
            child: Column(
              children: [
                Text(dialogText ?? 'AppAssets.dialog'),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      color: Colors.deepOrangeAccent,
                      child: Text(
                        btnText ?? 'Button',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
//! custom Dailog
  AppDialog.customDialog({
    String? dialogText,
    String? btnText,
    Color? btnColor,
    Color? btnTextColor,
    VoidCallback? onTap,
    bool? barrierDismissible,
  }) {
    showDialog(
      barrierDismissible: barrierDismissible ?? kDebugMode,
      context: navigatorKey.currentContext!,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dialogText ?? ' AppAssets.dialog'),
              const SizedBox(height: 40),
              InkWell(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.infinity,
                    color: btnColor ?? Colors.grey,
                    child: Text(
                      btnText ?? 'Button',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //* Empty Dialog

  AppDialog.empty({
    required Widget child,
    ShapeBorder? shape,
  }) {
    Dialog(
      shape: shape,
      child: child,
    );
  }

  //! Alert Dialog

  static alertDialog({String? header, String? message}) {
    return showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CircleAvatar(radius: 30),
            Text(header ?? 'Hader'),
            const SizedBox(height: 30),
            Text(message ?? 'This is supposed to be a text'),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Yes'),
          ),
          OutlinedButton(
            onPressed: () => context.navigator.pop(),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  static Future modalSheet({
    Widget? child,
    List<Widget>? children,
  }) {
    return showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isDismissible: false,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (children != null) ...children,
                if (child != null) child,
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppDialog.openBottomSheet({
    List<Widget>? children,
    Widget? child,
  }) {
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 130,
                      height: 3.49,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFC4C4C4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    if (children != null) ...children,
                    if (child != null) child,
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// Can take a child as a Widget e.g [FlutterSpinkit]
  ///
  /// bgColor for the loader's background color
  ///
  /// color for the loader's default spinner
  AppDialog.loader({
    Color? bgColor,
    Color? loaderColor,
    Widget? child,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: kDebugMode,
      builder: (context) => Center(
        child: child ??
            Container(
              height: 60,
              width: 60,
              decoration: ShapeDecoration(
                color: bgColor ?? Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularProgressIndicator(
                  color: loaderColor ?? Colors.purple,
                ),
              ),
            ),
      ),
    );
  }

  static Future<int?> bottomSheet({
    List<Widget>? children,
    Widget? child,
  }) {
    return showModalBottomSheet<int>(
      context: navigatorKey.currentContext!,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Add more widgets as needed
                  if (children != null) ...children,
                  if (child != null) child,
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
      backgroundColor: navigatorKey.currentContext!.colorScheme.background,
      isScrollControlled: isScrolled ?? false,
      useRootNavigator: true,
      builder: builder,
      context: navigatorKey.currentContext!,
    );
  }
}
