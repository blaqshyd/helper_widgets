import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/modules/leaderbord/leader_board.dart';
import 'package:helper/modules/list_card/the_list_card.dart';
import 'package:helper/modules/image_cache/precache_image.dart';
import 'package:helper/modules/insta_profile/insta_profile.dart';
// import 'package:helper/src/tab_bar_scroll/tab_bar_scroll.dart';

class IndexedStackNav extends StatefulWidget {
  const IndexedStackNav({super.key});

  @override
  IndexedStackNavState createState() => IndexedStackNavState();
}

class IndexedStackNavState extends State<IndexedStackNav> {
  final List<Widget> _pages = [
    const LeaderBoard(),
    const TheListCard(),
    const PrecacheImage(),
    const InstaProfile()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColor.black7,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 0;
              }),
              child: const Icon(Icons.leaderboard_rounded),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 1;
              }),
              child: const Icon(Icons.newspaper),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 2;
              }),
              child: const Icon(Icons.person),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _selectedIndex = 3;
              }),
              child: const Icon(Icons.tab_rounded),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
    );
  }
}
