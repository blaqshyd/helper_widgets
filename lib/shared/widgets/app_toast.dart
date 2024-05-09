import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  AppToast();

  AppToast.success(
    String? message, {
    String? desc,
  }) {
    toastification.show(
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      alignment: Alignment.topCenter,
      title: Text(message ?? 'Successful'),
      description: desc != null ? Text(desc) : null,
      showProgressBar: false,
      closeOnClick: false,
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (context, animation, alignment, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  AppToast.error(
    String? message, {
    String? desc,
  }) {
    toastification.show(
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      title: Text(message ?? 'Error Message'),
      description: desc != null ? Text(desc) : null,
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

  AppToast.info(
    String? message, {
    String? desc,
  }) {
    toastification.show(
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      closeButtonShowType: CloseButtonShowType.none,
      alignment: Alignment.topCenter,
      title: Text(message ?? 'Info'),
      icon: const Icon(Icons.info),
      autoCloseDuration: const Duration(seconds: 3),
      showProgressBar: false,
      closeOnClick: false,
    );
  }

  AppToast.custom(
    String? message, {
    String? desc,
  }) {
    toastification.showCustom(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue,
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message ?? "Custom message",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                desc ?? 'This is a custom toast message!',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  AppToast.defaultSnack(
    String message, {
    bool? isSuccess,
    Color? textColor,
  }) {
    SnackBar snackBar = SnackBar(
      elevation: 2,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: switch (isSuccess) {
        true => Colors.green,
        _ => Colors.red
      },
      content: Row(
        children: [
          switch (isSuccess) {
            true => const Icon(Icons.done_all),
            _ => const Icon(Icons.error),
          },
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: TextStyle(color: textColor ?? Colors.white),
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(navigatorKey.currentContext!).height - 120,
        left: 20,
        right: 20,
      ),
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
