import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helper/constants/app_colors.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColor.background,
        child: const SpinKitPulse(
          color: AppColor.black10,
          duration: Duration(seconds: 2),
          size: 50.0,
        ),
      ),
    );
  }
}
