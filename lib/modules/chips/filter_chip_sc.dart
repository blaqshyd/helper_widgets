// import 'package:flutter/material.dart';

// class FilterChipScreen extends StatefulWidget {
//   const FilterChipScreen({super.key});

//   @override
//   State<FilterChipScreen> createState() => _FilterChipScreenState();
// }

// class _FilterChipScreenState extends State<FilterChipScreen> {
//   bool newValue = false;
//   List<String> selectedChoices = [];
//   List<String> choices = [
//     'Mini Civic',
//     'Bugatti Expedition',
//     'Land Rover Corvette',
//     'Tesla Golf',
//     'Volkswagen Malibu',
//     'Mazda Mustang',
//     'Nissan Countach',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//         child: Wrap(
//           spacing: 8,
//           children: List.generate(
//             choices.length,
//             (index) => FilterChip(
//               // avatar: const Icon(Icons.add),
//               selectedColor: Colors.green,
//               checkmarkColor: Colors.white,
//               // showCheckmark: false,
//               label: Text(choices[index]),
//               selected: newValue,
//               onSelected: (value) {
//                 setState(() {
//                   newValue = value;
//                 });
//               },
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:helper/core/core.dart';

class FilterChipScreen extends StatefulWidget {
  const FilterChipScreen({Key? key}) : super(key: key);

  @override
  State<FilterChipScreen> createState() => _FilterChipScreenState();
}

class _FilterChipScreenState extends State<FilterChipScreen> {
  ListOfString choices = [
    'Mini Civic',
    'Bugatti Expedition',
    'Land Rover Corvette',
    'Tesla Golf',
    'Volkswagen Malibu',
    'Mazda Mustang',
    'Nissan Countach',
  ];
  ListOfBool selectedChoices = List.filled(7, false);
  // Initialize with 7 elements, all set to false

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Wrap(
            spacing: 8,
            children: List.generate(choices.length, (index) {
              final selected = selectedChoices[index];
              return FilterChip(
                // avatar: const Icon(Icons.add),
                selectedColor: Colors.green,
                checkmarkColor: Colors.white,
                // showCheckmark: false,
                label: Text(choices[index]),
                selected: selected,
                onSelected: (value) {
                  setState(() {
                    selectedChoices[index] = value;
                  });
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
