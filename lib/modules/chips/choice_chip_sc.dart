import 'package:flutter/material.dart';
import 'package:helper/core/core.dart';

class ChoiceChipScreen extends StatefulWidget {
  const ChoiceChipScreen({Key? key}) : super(key: key);

  @override
  ChoiceChipScreenState createState() => ChoiceChipScreenState();
}

class ChoiceChipScreenState extends State<ChoiceChipScreen> {
  final ListOfBool _isSelected = List.filled(7, false);

  List<String> choices = [
    'Mini Civic',
    'Land Rover Corvette',
    'Tesla Golf',
    'Volkswagen Malibu',
    'Mazda Mustang',
    'Nissan Countach',
    'Bugatti Expedition'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Wrap(
          spacing: 8,
          children: List.generate(
            choices.length,
            (index) => ChoiceChip(
              label: Text(choices[index]),
              selected: _isSelected[index],
              onSelected: (_) {
                setState(() {
                  _isSelected[index] = _;
                });
              },
            ),
          ),
        ),
      )),
    );
  }
}
