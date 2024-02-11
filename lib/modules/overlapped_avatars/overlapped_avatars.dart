import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';

class OverlappedAvatar extends StatelessWidget {
  OverlappedAvatar({
    super.key,
  });

  final List<String> storyAvatar = [
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
    AppAssets.image
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  storyAvatar.length,
                  (index) => Align(
                      widthFactor: 0.48,
                      child: CircleAvatar(
                        minRadius: 21.5,
                        backgroundColor: AppColor.background,
                        child: CircleAvatar(
                          backgroundColor: AppColor.overlay,
                          backgroundImage: NetworkImage(storyAvatar[index]),
                          maxRadius: 20,
                        ),
                      ))),
            ),
            Align(
              widthFactor: 0.32,
              child: CircleAvatar(
                backgroundColor: AppColor.black7,
                child: Text(
                  '+6',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColor.background),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
