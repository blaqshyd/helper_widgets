import 'package:flutter/material.dart';
import 'package:helper/core/extensions/index.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> tabPairs = [
  TabPair(
    tab: const Tab(
      text: 'Intro',
    ),
    view: const Center(
      child: Text(
        'Intro here',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ),
  TabPair(
    tab: const Tab(
      text: 'Steps',
    ),
    view: ListView.separated(
      itemCount: 24,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return Text(
          '$index',
          style: context.appTextTheme.headline,
        );
      },
    ),
  )
];

class TabBarAndTabViews extends StatefulWidget {
  const TabBarAndTabViews({super.key});

  @override
  TabBarAndTabViewsState createState() => TabBarAndTabViewsState();
}

class TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xFFFF8527),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: tabPairs.map((tabPair) => tabPair.tab).toList(),
                ),
              ),
              45.sbH,
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: tabPairs.map((tabPair) => tabPair.view).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
