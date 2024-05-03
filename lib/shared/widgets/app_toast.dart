import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

abstract class AppToast {
  AppToast._();

  static void success(
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

  static void error(
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

  static void info(
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
