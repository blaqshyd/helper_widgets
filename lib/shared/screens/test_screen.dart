import 'package:flutter/material.dart';
import 'package:helper/core/core.dart';
import 'package:helper/core/extensions/widget.ext.dart';
import 'package:helper/modules/expansion_tiles/expansion_tiles.dart';
import 'package:helper/shared/widgets/triple_trail.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/dot_indicator.dart';

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
      // padding: EdgeInsets.zero,
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
          'assets/oval_red.png'.imgAsset(h: 120).fadeInFromBottom(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => DotIndicator(
                  currentIndex: 1,
                  index: index,
                  activeColor: color,
                  inactiveColor: AppColor.radioActiveColor,
                ),
              ),
            ),
          ),
          const TripleTrail(
            leading: BackButton(),
            middle: Text('Home'),
            trailing: ActionChip(label: Text('Search')),
          )
        ],
      ),
    );
  }
}
