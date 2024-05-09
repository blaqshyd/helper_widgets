import 'package:flutter/material.dart';
import 'package:helper/core/extensions/int_ext.dart';
import 'package:helper/core/extensions/num_ext.dart';
import 'package:helper/core/extensions/widget.ext.dart';
import 'package:helper/core/index.dart';

import '../widgets/app_scaffold.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  TestScreenState createState() => TestScreenState();
}

class TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final color = generateRandomColor();
    final id = generateRandomId();
    return AppScaffold(
      title: const Text('Test Screen'),
      padding: EdgeInsets.zero,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: color,
            child: Text(
              id,
              style: context.appTextTheme.title,
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: 'assets/oval.png'.assetImg,
              ),
            ),
          ).fadeIn(),
          'assets/oval_red.png'.imgAsset(h: 120),
          ElevatedButton(
            onPressed: () {},
            child: Text(12345.formatAmt),
          ),
          const TextField(),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text(100000.asCurrency),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text('Sign Up '.trimSpaces),
          ).dismissKeyboard(),
        ],
      ),
    );
  }
}
