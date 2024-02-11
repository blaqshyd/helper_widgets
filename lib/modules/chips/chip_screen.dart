import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:helper/modules/chips/choice_chip_sc.dart';
import 'package:helper/modules/chips/filter_chip_sc.dart';
import 'package:helper/modules/chips/raw_chip_sc.dart';

class ChipScreen extends StatefulWidget {
  const ChipScreen({Key? key}) : super(key: key);

  @override
  ChipScreenState createState() => ChipScreenState();
}

class ChipScreenState extends State<ChipScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: AppSizing.padding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            RawChipScreen(),
            FilterChipScreen(),
            ChoiceChipScreen(),
          ],
        ),
      ),
    ));
  }
}
