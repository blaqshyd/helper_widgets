import 'package:flutter/material.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DropdownBtn extends StatefulWidget {
  const DropdownBtn({Key? key}) : super(key: key);

  @override
  DropdownBtnState createState() => DropdownBtnState();
}

class DropdownBtnState extends State<DropdownBtn> {
  List<String> dropdownItems = [
    '- Select value -',
    'Fuel',
    'Diesel',
    'Gasoline',
    'Electric'
  ];

  String selectedValue = '- Select value -';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drop down'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Label', style: Theme.of(context).textTheme.bodyLarge),
            8.sbH,
            DropdownButtonFormField(
              onChanged: (value) {},
              value: selectedValue,
              dropdownColor: Colors.grey[200],
              elevation: 0,
              icon: const Icon(Iconsax.arrow_bottom_copy),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items:
                  dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
