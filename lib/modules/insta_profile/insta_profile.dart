// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/modules/insta_profile/profile_header.dart';
import 'package:helper/modules/insta_profile/the_tab_card.dart';

class InstaProfile extends StatefulWidget {
  const InstaProfile({super.key});

  @override
  InstaProfileState createState() => InstaProfileState();
}

class InstaProfileState extends State<InstaProfile>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> myTabs = const [
    Tab(icon: Icon(Icons.grid_on_outlined)),
    Tab(icon: Icon(Icons.video_file_rounded)),
    Tab(icon: Icon(Icons.person_add_alt_rounded)),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                expandedHeight: 360,
                collapsedHeight: 360,
                flexibleSpace: ProfileHeader(),
              ),
              SliverPersistentHeader(
                delegate: MyTabBar(
                  TabBar(
                    // isScrollable: true,
                    // onTap: (value) => setState(() {}),
                    controller: tabController,
                    tabs: myTabs,
                  ),
                ),
                pinned: true,
                floating: true,
              )
            ];
          },
          body: TabBarView(
            controller: tabController,
            children: const [
              TheTabCard(),
              TheTabCard(),
              TheTabCard(),
            ],
          )),
    );
  }
}

class MyTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  MyTabBar(this.tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: AppColor.background, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
