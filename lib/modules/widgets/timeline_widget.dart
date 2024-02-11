// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

import '../overlapped_avatars/overlapped_avatars.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: AppSizing.padding,
        child: ListView(
          children: List.generate(
            1,
            (index) => TimelineWidget(
              isFirst: index == 0 ? true : false,
              isLast: index == 2 ? true : false,
            ),
          ),
        ),
      ),
    ));
  }
}

class TimelineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  const TimelineWidget({
    Key? key,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: TimelineTile(
        hasIndicator: true,
        isFirst: isFirst,
        isLast: isLast,
        lineXY: 1.0,
        indicatorStyle: IndicatorStyle(
            height: 20,
            width: 20,
            indicator: Container(
              decoration: const BoxDecoration(
                // color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.circle,
                size: 14,
                // color: AppColors.lightBgColor,
              ),
            )),
        beforeLineStyle: const LineStyle(
          // color: AppColors.secondaryColor,
          thickness: 2,
        ),
        endChild: const TaskCard(),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.background,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: AppSizing.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Meeting work report',
                // style: AppTextTheme.t16.copyWith(
                //   fontWeight: FontWeight.w300,
                //   color: AppColors.lightBgColor,
                // ),
              ),
              AppSizing.h08,
              const Text(
                'Discuss weekly report with the team',
                // style: AppTextTheme.t14.copyWith(
                //   color: AppColors.lightBgColor,
                //   fontSize: 12,
                // ),
              ),
              AppSizing.h08,
              const Divider(
                height: 1,
                color: Colors.white,
              ),
              AppSizing.h12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Iconsax.clock,
                        size: 16,
                        // color: AppColors.lightBgColor,
                      ),
                      AppSizing.w08,
                      const Text(
                        '10:00 - 12:00 pm',
                        // style: AppTextTheme.t12.copyWith(
                        //   color: AppColors.lightBgColor,
                        // ),
                      ),
                    ],
                  ),
                  AppSizing.w16,
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    // height: 34,
                    child: OverlappedAvatar(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:timeline_tile_nic/timeline_tile.dart';

import 'package:workflow/src/presentation/screens/views/schedule/schedule.dart';
import 'package:workflow/utils/constants/screens.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: AppConstant.padding,
        child: ListView(
          children: List.generate(
            3,
            (index) => TimelineWidget(
              isFirst: index == 0 ? true : false,
              isLast: index == 2 ? true : false,
            ),
          ),
        ),
      ),
    ));
  }
}

class TimelineWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  const TimelineWidget({
    Key? key,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: TimelineTile(
        hasIndicator: true,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            height: 30,
            width: 30,
            indicator: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.circle,
                size: 14,
                color: AppColors.lightBgColor,
              ),
            )),
        beforeLineStyle: LineStyle(
          color: AppColors.secondaryColor,
          thickness: 2,
        ),
        endChild: const TaskCard(),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.primaryColor,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: AppConstant.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Meeting work report',
                style: AppTextTheme.t16.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.lightBgColor,
                ),
              ),
              AppSizing.h08,
              Text(
                'Discuss weekly report with the team',
                style: AppTextTheme.t14.copyWith(
                  color: AppColors.lightBgColor,
                  fontSize: 12,
                ),
              ),
              AppSizing.h08,
              const Divider(
                height: 1,
                color: Colors.white,
              ),
              AppSizing.h12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock,
                        size: 16,
                        color: AppColors.lightBgColor,
                      ),
                      AppSizing.w08,
                      Text(
                        '10:00 - 12:00 pm',
                        style: AppTextTheme.t12.copyWith(
                          color: AppColors.lightBgColor,
                        ),
                      ),
                    ],
                  ),
                  AppSizing.w16,
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    // height: 34,
                    child: const OverlappedAvatar2(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */
