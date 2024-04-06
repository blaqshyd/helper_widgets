import 'package:flutter/material.dart';

class Snack {
  static showBar({required BuildContext context, String? text}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text ?? 'Default Snackbar Text'),
          elevation: 2,
          shape: const StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}
