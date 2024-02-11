import 'package:flutter/material.dart';

class SnackBarUtil {
  static showSnackBar({required BuildContext context, String? text}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? 'Default Snackbar Text'),
        elevation: 2,
        shape: const StadiumBorder(),
        // showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
