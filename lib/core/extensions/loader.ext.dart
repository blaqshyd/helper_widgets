import 'package:flutter/material.dart';

// *** v1.0 ***


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
