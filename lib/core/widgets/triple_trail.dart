// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TripleTrail extends StatelessWidget {
  const TripleTrail({
    super.key,
    this.trailing,
    this.leading,
    this.middle,
  });

  final Widget? trailing;
  final Widget? leading;
  final Widget? middle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            heightFactor: 1,
            child: leading,
          ),
        ),
        if (middle != null) middle!,
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            heightFactor: 1,
            child: trailing,
          ),
        ),
      ],
    );
  }
}
