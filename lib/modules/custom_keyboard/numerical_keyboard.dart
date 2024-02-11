import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class NumericalKeyboard extends StatelessWidget {
  final KeyboardCallback? onKeyPressed;
  final bool showFaceID;

  const NumericalKeyboard({
    super.key,
    this.onKeyPressed,
    this.showFaceID = false,
  });

  static const backspaceKey = 42;
  static const clearKey = 69;
  static const faceIDKey = 52;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(flex: 1.0),
      // border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            _buildNumberKey(1),
            _buildNumberKey(2),
            _buildNumberKey(3),
          ],
        ),
        TableRow(
          children: [
            _buildNumberKey(4),
            _buildNumberKey(5),
            _buildNumberKey(6),
          ],
        ),
        TableRow(
          children: [
            _buildNumberKey(7),
            _buildNumberKey(8),
            _buildNumberKey(9),
          ],
        ),
        TableRow(
          children: [
            if (showFaceID) ...[
              InkWell(
                onTap: () => onKeyPressed!(faceIDKey),
                // child: GFImageSvg(
                //   svgPath: GFAssets.biometrics,
                //   color: GFColors.darkTheme ? GFColors.appWhiteColor : null,
                // ).paddingAll(25),
                child: const Icon(Iconsax.finger_scan_copy),
              ),
            ] else ...[
              Container(),
            ],
            _buildNumberKey(0),
            _buildKey(const Icon(Icons.backspace), backspaceKey),
          ],
        )
      ],
    );
  }

  Widget _buildNumberKey(int n) {
    return _buildKey(
        // GFTextWidget(
        //   title: '$n',
        //   textSize: GFTypography.fontHeadlineSmall,
        //   fontWeight: FontWeight.w700,
        //   textStyle: GFTypography.textHeadlineSmallStyle
        //       .copyWith(color: GFColors.appPrimaryText),
        // ),
        Text('$n'),
        n);
  }

  Widget _buildKey(Widget icon, int key) {
    return IconButton(
      icon: icon,
      padding: const EdgeInsets.all(25.0),
      onPressed: () => onKeyPressed!(key),
    );
  }
}

typedef KeyboardCallback = Function(int key);

//TODO: write a function that will be called when the key is pressed
