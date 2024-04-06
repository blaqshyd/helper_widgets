import 'package:flutter/material.dart';

class RawChipScreen extends StatefulWidget {
  const RawChipScreen({super.key});

  @override
  RawChipScreenState createState() => RawChipScreenState();
}

class RawChipScreenState extends State<RawChipScreen> {
  List<String> selectedChoices = [];

  List<String> choices = [
    'Mini Civic',
    'Bugatti Expedition',
    'Land Rover Corvette',
    'Tesla Golf',
    'Volkswagen Malibu',
    'Mazda Mustang',
    'Nissan Countach',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Wrap(
            spacing: 8,
            children: choices
                .map((choice) => RawChip(
                    label: Text(choice),
                    selected: selectedChoices.contains(choice),
                    onSelected: (selected) {
                      setState(() {
                        selected
                            ? selectedChoices.add(choice)
                            : selectedChoices.remove(choice);
                      });
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}
