import 'package:flutter/material.dart';

class SliderBox extends StatefulWidget {
  const SliderBox({Key? key}) : super(key: key);

  @override
  State<SliderBox> createState() => _SliderBoxState();
}

class _SliderBoxState extends State<SliderBox> {
  @override
  Widget build(BuildContext context) {
    double value = 1.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
          child: SizedBox(
        height: 240,
        child: Row(
          verticalDirection: VerticalDirection.up,
          children: [
            const Expanded(
              child: Column(
                children: [
                  Text('Hello'),
                  Text('World'),
                ],
              ),
            ),
            Slider(
              divisions: 3,
              value: value,
              max: 3,
              min: 0,
              onChanged: (value) {
                setState(() {
                  value = value;
                });
              },
            )
          ],
        ),
      )),
    );
  }
}
