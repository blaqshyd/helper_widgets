// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:helper/common/common.dart';

class TabBarSCroll2 extends StatefulWidget {
  const TabBarSCroll2({Key? key}) : super(key: key);

  @override
  TabBarSCroll2State createState() => TabBarSCroll2State();
}

class TabBarSCroll2State extends State<TabBarSCroll2>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 400,
              flexibleSpace: Container(),
            ),
            SliverPersistentHeader(
              delegate: MyTabBar(const TabBar(tabs: [
                Tab(text: 'Chats'),
                Tab(text: 'Status'),
                Tab(text: 'Calls'),
              ])),
              pinned: true,
              floating: true,
            )
          ];
        },
        body: ListView.builder(
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
        ),
      ),
    );
  }
}

class MyTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  MyTabBar(this.tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return tabBar;
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
