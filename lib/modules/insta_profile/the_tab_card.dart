// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';

class TheTabCard extends StatelessWidget {
  const TheTabCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: 80,
          color: AppColor.dGreenDarker,
          child: Text(
            'item $index',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColor.background,
                ),
          ),
        ),
      ),
    );
  }
}
