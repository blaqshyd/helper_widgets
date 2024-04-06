import 'package:flutter/material.dart';

class GridViewMod extends StatelessWidget {
  const GridViewMod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 230,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.red)),
                    Expanded(child: Container(color: Colors.green)),
                  ],
                ),
              ),
              Expanded(child: Container(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
