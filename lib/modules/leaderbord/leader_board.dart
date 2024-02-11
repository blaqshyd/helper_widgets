import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizing.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Rewards',
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: AppSizing.borderRadius,
                      color: AppColor.black6,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 18,
                    ),
                    child: const Text('Bal: 180'),
                  ),
                ],
              ),
              AppSizing.h16,
              const Text(
                'Play quiz\'s and earn rewards everyday',
                style: TextStyle(fontSize: 24),
              ),

              const Spacer(),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        width: 70,
                        color: AppColor.black6,
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: -40,
                        // top: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.black6,
                          radius: 46,
                          child: CircleAvatar(radius: 42),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        width: 70,
                        color: AppColor.black6,
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: -40,
                        // top: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.black6,
                          radius: 46,
                          child: CircleAvatar(radius: 42),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        width: 70,
                        color: AppColor.black6,
                      ),
                      const Positioned(
                        left: 0,
                        right: 0,
                        top: -40,
                        // top: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColor.black6,
                          radius: 46,
                          child: CircleAvatar(radius: 42),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              // AppSizing.h12,
              const YourRank(),
              const Spacer(),
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: AppSizing.borderRadius,
                    color: AppColor.black6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 18,
                  ),
                  child: const Text('Play Quiz')),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class YourRank extends StatelessWidget {
  const YourRank({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppSizing.borderRadius,
        color: AppColor.black5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 18,
      ),
      child: const Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Rank: 180'),
              Text('Leaderboard'),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -34,
            // top: 0,
            child: CircleAvatar(
              backgroundColor: AppColor.black5,
              radius: 46,
              child: CircleAvatar(radius: 42),
            ),
          ),
        ],
      ),
    );
  }
}
