import 'package:flutter/material.dart';

enum Screens { mobile, tablet, desktop }

class ResLayout extends StatelessWidget {
  const ResLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case < 600:
            return mobile;
          case < 1100:
            return tablet;
          default:
            return desktop;
        }
      },
    );
  }
}
