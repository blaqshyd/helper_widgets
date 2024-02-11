import 'package:flutter/material.dart';
import 'package:helper/core/extensions/extensions_.dart';

import '../widgets/list_card.dart';

class TheListCard extends StatelessWidget {
  const TheListCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              24.sbH,
              Expanded(
                child: ListView.separated(
                  itemCount: 5,
                  separatorBuilder: (BuildContext context, int index) {
                    return 16.sbH;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return const TheCard();
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
