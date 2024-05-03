import 'package:flutter/material.dart';
import "package:flutter_animate/flutter_animate.dart";

extension DismissKeyboard on Widget {
  void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}

extension WidgetAnimation on Widget {
  Animate fadeInFromTop({
    Duration? delay,
    Duration? animatiomDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 500.ms)
          .move(
            duration: animatiomDuration ?? 500.ms,
            begin: offset ?? const Offset(0, -1),
          )
          .fade(duration: animatiomDuration ?? 500.ms);

  Animate fadeInFromBottom({
    Duration? delay,
    Duration? animatiomDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? 500.ms)
          .move(
            duration: animatiomDuration ?? 500.ms,
            begin: offset ?? const Offset(0, 10),
          )
          .fade(duration: animatiomDuration ?? 500.ms);

  Animate fadeIn({
    Duration? delay,
    Duration? animatiomDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? 500.ms).fade(
        duration: animatiomDuration ?? 500.ms,
        curve: curve ?? Curves.decelerate,
      );
}

extension InkWellExtension on Widget {
  InkWell tap({
    required GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    BorderRadius? borderRadius,
    Color? splashColor = Colors.transparent,
    Color? highlightColor = Colors.transparent,
  }) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: this,
    );
  }
}

extension LoadingWidget on Widget {
  Widget ignoreTaps(bool isLoading) {
    return switch (isLoading) {
      true => const SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator.adaptive(),
        ),
      _ => this
    };
  }
}

extension LoadingButton on ElevatedButton {
  Widget ignoreBTaps(bool isLoading) {
    return isLoading
        ? ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 60),
            ),
            child: const SizedBox.square(
              dimension: 24,
              child: CircularProgressIndicator.adaptive(),
            ),
          )
        : this;
  }
}

extension LoadingContainerWidget on Widget {
  Widget ignoreCTaps(bool isLoading) {
    return switch (isLoading) {
      true => Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 60,
          decoration: ShapeDecoration(
            color: Colors.grey[600]!.withOpacity(.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      _ => this
    };
  }
}

extension ContainerLoader on Container {
  Container containIgnore(bool isLoading) {
    return switch (isLoading) {
      true => Container(
          alignment: alignment,
          decoration: decoration,
          child: const SizedBox.square(
            dimension: 24,
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      _ => this
    };
  }
}

extension AlignExtension on Widget {
  Align align(Alignment alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Align alignCenter() {
    return Align(
      alignment: Alignment.center,
      child: this,
    );
  }

  Align alignCenterLeft() {
    return Align(
      alignment: Alignment.centerLeft,
      child: this,
    );
  }

  Align alignCenterRight() {
    return Align(
      alignment: Alignment.centerRight,
      child: this,
    );
  }

  Align alignTopCenter() {
    return Align(
      alignment: Alignment.topCenter,
      child: this,
    );
  }

  Align alignBottomCenter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: this,
    );
  }

  // Add more alignment methods as needed

  // Example: alignTopCenter, alignBottomRight, etc.
}
