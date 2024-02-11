import 'package:flutter/material.dart';

@Deprecated('This is a deprecated feature and will be removed.')
class ButtonUtil {
  static filled({
    Color? fgColor,
    Color? bgColor,
    String? text,
    VoidCallback? cta,
    bool? hasIcon,
    BorderRadiusGeometry? borderRadius,
  }) {
    return InkWell(
      onTap: cta,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: double.infinity,
          color: bgColor ?? Colors.grey,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: hasIcon ?? false,
                child: const CircleAvatar(),
              ),
              hasIcon == false
                  ? const SizedBox(width: 12)
                  : const SizedBox.shrink(),
              Text(
                text ?? 'Button',
                style: TextStyle(color: fgColor ?? Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static outlined({
    Color? fgColor,
    Color? bgColor,
    String? text,
    bool? hasIcon,
    Widget? child,
    VoidCallback? cta,
  }) {
    return InkWell(
      onTap: cta,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: bgColor ?? Colors.grey[800]!),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon ?? false,
              child: child ?? const SizedBox.shrink(),
            ),
            hasIcon == true
                ? const SizedBox(width: 12)
                : const SizedBox.shrink(),
            Text(
              text ?? 'Button',
              style: TextStyle(color: fgColor ?? Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

@Deprecated('message')
class ButtonUtill {
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
      child: isFilled
          ? _buildFilledButton(fgColor, bgColor, text, hasIcon, borderRadius)
          : _buildOutlinedButton(fgColor, bgColor, text, hasIcon, child),
    );
  }

  static Widget _buildFilledButton(
    Color? fgColor,
    Color? bgColor,
    String? text,
    bool? hasIcon,
    BorderRadiusGeometry? borderRadius,
  ) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        color: bgColor ?? Colors.grey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: hasIcon ?? false,
              child: const CircleAvatar(),
            ),
            hasIcon == false
                ? const SizedBox(width: 12)
                : const SizedBox.shrink(),
            Text(
              text ?? 'Button',
              style: TextStyle(color: fgColor ?? Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildOutlinedButton(
    Color? fgColor,
    Color? bgColor,
    String? text,
    bool? hasIcon,
    Widget? child,
  ) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.5, color: bgColor ?? Colors.grey[800]!),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: hasIcon ?? false,
            child: child ?? const SizedBox.shrink(),
          ),
          hasIcon == true ? const SizedBox(width: 12) : const SizedBox.shrink(),
          Text(
            text ?? 'Button',
            style: TextStyle(color: fgColor ?? Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
