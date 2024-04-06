import 'package:flutter/material.dart';

/// This is the usage of the Dot Indicator for smooth scroll indicator
///```dart
///   Align(
///      alignment: Alignment.bottomCenter,
///      child: Row(
///        mainAxisAlignment: MainAxisAlignment.center,
///        children: List.generate(
///          4,
///          (index) => DotIndicator(
///            currentIndex: 0,
///            index: index,
///            activeColor: Colors.amber,
///          ),
///        ),
///      ),
///    );
///),
///),
///),
///```

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.currentIndex,
    required this.index,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
  });

  final int currentIndex;
  final int index;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.long1,
      curve: Easing.emphasizedAccelerate,
      height: 8,
      width: currentIndex == index ? 24 : 12,
      margin: const EdgeInsets.only(right: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: currentIndex == index ? activeColor : inactiveColor,
      ),
    );
  }
}
