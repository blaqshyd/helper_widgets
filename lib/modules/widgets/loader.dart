// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helper/shared/constants/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.background,
        child: child ??
            const SpinKitPulse(
              color: AppColor.black10,
              duration: Duration(seconds: 2),
              size: 50.0,
            ),
      ),
    );
  }
}
