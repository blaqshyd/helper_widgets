import 'package:flutter/material.dart';
import 'package:helper/core/extensions/index.dart';
import 'package:helper/core/extensions/num_ext.dart';

import 'flexible_text.dart';

class OverflowTextS extends StatelessWidget {
  const OverflowTextS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Text Overflow - Row with column and Text'.txt(),
      ),
      body: SafeArea(
        child: Padding(
          padding: 8.padA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  cacheExtent: 1000,
                  itemCount: 40,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: 8.padA,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(child: 'KB'.txt()),
                          8.sbW,
                          const FlexibleText(),
                          4.sbW,
                          const Text('3h')
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
