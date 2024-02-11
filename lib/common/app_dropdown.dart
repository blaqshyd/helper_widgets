// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:helper/core/extensions/extensions_.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AppDropDown extends StatefulWidget {
  final String? label;
  final Widget? icon;

  const AppDropDown({
    Key? key,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
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
            Text(
              widget.label ?? 'Label',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            8.sbH,
            DropdownButtonFormField(
              onChanged: (value) {},
              value: selectedValue,
              dropdownColor: Colors.grey[200],
              elevation: 0,
              icon: widget.icon ?? const Icon(Iconsax.arrow_bottom_copy),
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
