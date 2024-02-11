import 'package:flutter/material.dart';
import 'package:helper/modules/insta_profile/insta_profile.dart';
import 'package:helper/modules/leaderbord/leader_board.dart';

class NavWithIndexed extends StatefulWidget {
  const NavWithIndexed({Key? key}) : super(key: key);

  @override
  State<NavWithIndexed> createState() => _NavWithIndexedState();
}

class _NavWithIndexedState extends State<NavWithIndexed> {
  int currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          height: 70,
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: destinations,
          selectedIndex: currentIdx,
          onDestinationSelected: (value) => setState(() {
            currentIdx = value;
          }),
        ),
        body: IndexedStack(
          index: currentIdx,
          children: pages,
        ));
  }
}

List<Widget> destinations = const [
  NavigationDestination(
    icon: Icon(Icons.home),
    label: 'Home',
    selectedIcon: Icon(Icons.home_filled), // For when the icon is selected
  ),
  NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  NavigationDestination(
    icon: Icon(Icons.notifications),
    label: 'Notifications',
  ),
];

List<Widget> pages = [
  const InstaProfile(),
  const LeaderBoard(),
  const LeaderBoard(),
];
