import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Dialogs {
  Dialogs._();
  //! Dialog with header and default

  /// This is supposed to explain what this is doing
  static Future normalDialog(
    BuildContext context, {
    String? dialogText,
    String? dialogHeader,
    String? btnText,
    VoidCallback? onTap,
  }) {
    return showDialog(
      // Can't exit the dialog by pressing anywhere on the screen
      // kDebugMode means barrierDismissable is true only in debug mode
      //? Barrier Color is for unfocused bg color
      barrierDismissible: kDebugMode,
      // barrierColor: Colors.grey,
      context: context,
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
  static customDialog(
    BuildContext context, {
    String? dialogText,
    String? btnText,
    Color? btnColor,
    Color? btnTextColor,
    VoidCallback? onTap,
  }) {
    return showDialog(
      barrierDismissible: kDebugMode,
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  static empty(BuildContext ctx, {required Widget child, ShapeBorder? shape}) {
    return Dialog(
      shape: shape,
      child: child,
    );
  }

  //! Alert Dialog

  static alertDialog(BuildContext context, {String? header}) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CircleAvatar(radius: 30),
            Text('Alert Dialog'),
            SizedBox(height: 30),
            Text('This is supposed to be a text'),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {},
            child: const Text('Yes'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  static Future modalSheet(
    BuildContext context, {
    Widget? child,
    List<Widget>? children,
  }) {
    return showModalBottomSheet(
      context: context,
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

  static Future openBottomSheet(
    BuildContext context, {
    List<Widget>? children,
    Widget? child,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(),
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

  static Future bottomSheet(
    BuildContext context, {
    List<Widget>? children,
    Widget? child,
  }) {
    return showModalBottomSheet(
      context: context,
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

  /// Can take a child as a Widget e.g [FlutterSpinkit]
  static void loader(
    BuildContext context, {
    Color? bgColor,
    Color? loaderColor,
    Widget? child,
  }) {
    showDialog(
      context: context,
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

  static void defaultSnack(
    context, {
    required String message,
  }) {
    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(Icons.error),
          const SizedBox(width: 8),
          Flexible(
            child: Text(message),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height - 180,
        left: 30,
        right: 30,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void errorSnack(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void showSnackbar(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(message),
      ),
    );
  }

  static void successSnack(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void successToast(
    BuildContext context, {
    String? message,
    String? desc,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      title: Text(message ?? 'Successful'),
      description: Text(desc!),
      showProgressBar: false,
      closeOnClick: false,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static void errorToast(
    BuildContext context, {
    String? message,
    String? desc,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      title: Text(message ?? 'Error Message'),
      description: Text(desc!),
      showProgressBar: false,
      closeOnClick: false,
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  static void infoToast(
    BuildContext context, {
    String? message,
    String? desc,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      title: Text(message ?? 'Info'),
      description: Text(desc!),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
      closeOnClick: false,
      pauseOnHover: false,
      showProgressBar: false,
    );
  }
}
