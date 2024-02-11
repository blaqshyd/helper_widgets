import 'package:flutter/material.dart';

class CustomPaintOne extends StatelessWidget {
  const CustomPaintOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('label'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CustomPaint()],
        ),
      ),
    );
  }
}
