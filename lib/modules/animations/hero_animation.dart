import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => push(const HeroAnimation2()),
          child: Hero(
            tag: 'hero-animation',
            child: Container(
              alignment: Alignment.center,
              height: 120,
              width: 120,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(),
                color: Colors.green,
              ),
              child: const Text('text'),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimation2 extends StatelessWidget {
  const HeroAnimation2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: 'hero-animation',
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}
