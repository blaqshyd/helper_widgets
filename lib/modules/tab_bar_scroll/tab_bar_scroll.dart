import 'package:flutter/material.dart';

class TabBarScroll extends StatefulWidget {
  const TabBarScroll({super.key});

  @override
  TabBarScrollState createState() => TabBarScrollState();
}

class TabBarScrollState extends State<TabBarScroll>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    const Tab(text: 'auto short'),
    const Tab(text: 'auto long'),
    const Tab(text: 'fixed'),
  ];

  Widget _buildCarousel() {
    return const Stack(
      children: <Widget>[
        Placeholder(fallbackHeight: 400),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: Text('Slider'))),
      ],
    );
  }

  late TabController _tabController;
  late ScrollController _scrollController;
  bool fixedScroll = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  _buildTabContext(int lineCount) => ListView.builder(
        padding: const EdgeInsets.all(12),
        physics: const ClampingScrollPhysics(),
        itemCount: lineCount,
        itemBuilder: (BuildContext context, int index) {
          return Text('item ${index + 1}');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(child: _buildCarousel()),
            SliverToBoxAdapter(
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.redAccent,
                // isScrollable: true,
                tabs: myTabs,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContext(2),
            _buildTabContext(20),
            _buildTabContext(2)
          ],
        ),
      ),
    );
  }
}
