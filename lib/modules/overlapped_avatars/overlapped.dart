import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';

class Overlapped extends StatelessWidget {
  Overlapped({super.key});

  final List<String> storyAvatar = [
    AppAssets.image,
    AppAssets.image,
    AppAssets.image,
    AppAssets.image
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          ...List.generate(
            storyAvatar.length,
            (idx) {
              return Positioned(
                left: switch (idx) {
                  0 => 0,
                  _ => (22 * idx).toDouble(),
                },
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColor.black13,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: AppColor.black11,
                          backgroundImage: NetworkImage(storyAvatar[idx]),
                        ),
                      ),
                      //  Container(
                      //         padding: const EdgeInsets.all(8),
                      //         decoration: const BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           color: AppColor.black5,
                      //         ),
                      //         child: const Text(
                      //           '+2',
                      //         ),
                      //       ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      )),
    );
  }
}
