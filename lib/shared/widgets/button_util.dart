import 'package:flutter/material.dart';

class ButtonUtil {
  ButtonUtil._();
  static Widget build({
    Color? fgColor,
    Color? bgColor,
    String? text,
    VoidCallback? cta,
    bool? hasIcon,
    BorderRadiusGeometry? borderRadius,
    bool isFilled = true, // Default is filled button
    Widget? child,
  }) {
    return InkWell(
      onTap: cta,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: switch (isFilled) {
          true => BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(4),
              color: bgColor ?? Colors.grey,
            ),
          _ => BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: bgColor ?? Colors.grey[800]!,
              ),
              color: Colors.transparent,
              borderRadius: borderRadius ?? BorderRadius.circular(4),
            ),
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon ?? false,
              child: switch (hasIcon) {
                true => const CircleAvatar(),
                _ => const SizedBox.shrink(),
              },
            ),
            switch (hasIcon) {
              true => const SizedBox(width: 12),
              _ => const SizedBox.shrink(),
            },
            Text(
              text ?? 'Button',
              style: TextStyle(
                  color: fgColor ?? (isFilled ? Colors.white : Colors.grey),
                  fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
