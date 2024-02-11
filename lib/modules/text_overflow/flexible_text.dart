import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/core/extensions/extensions.dart';

class FlexibleText extends StatelessWidget {
  const FlexibleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //*  flexible does the trick
    return Flexible(
      child: AppAssets.dialog.txt(fontSize: 16),
      // fontWeight: FontWeight.w500,
      // overflow: TextOverflow.fade,
    );
  }
}
