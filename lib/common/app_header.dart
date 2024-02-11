import 'package:flutter/material.dart';

class AppbarHeader extends StatelessWidget {
  const AppbarHeader({
    Key? key,
    required this.text,
    this.isLeft = false,
    this.isRight = false,
    this.onRightTap,
  }) : super(key: key);

  final String text;
  final bool isLeft, isRight;
  final VoidCallback? onRightTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.cardBgColor,
      alignment: Alignment.center,
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility.maintain(
            visible: isLeft,
            child: InkWell(
              customBorder: const CircleBorder(side: BorderSide(width: 5)),
              onTap: isLeft ? () => Navigator.pop(context) : null,
              child: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Visibility.maintain(
            visible: isRight,
            child: InkWell(
              onTap: isRight ? null : onRightTap,
              child: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
