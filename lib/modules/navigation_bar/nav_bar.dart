import 'package:flutter/material.dart';
import 'package:helper/shared/shared.dart';
import 'package:helper/core/extensions/extensions_.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

//TODO check this out

class _NavBarState extends State<NavBar> {
  var position = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 1,
                icon: Icons.home,
                text: 'Home',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 2,
                icon: Icons.home,
                text: 'Cart',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 3,
                icon: Icons.home,
                text: 'Profile',
                onTap: (index) => setState(() => position = index),
              ),
            ),
            Expanded(
              child: NavButton(
                groupPosition: position,
                index: 4,
                icon: Icons.home,
                text: 'Settings',
                onTap: (index) => setState(() => position = index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final int index;
  final int groupPosition;
  final IconData icon;
  final String text;
  final void Function(int) onTap;
  const NavButton({
    super.key,
    required this.groupPosition,
    required this.index,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 45,
        decoration: BoxDecoration(
          color: groupPosition == index
              ? AppColor.yellowDarkHover
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: groupPosition == index
                  ? AppColor.black1
                  : AppColor.background,
            ),
            if (groupPosition == index) ...[
              5.sbW,
              const Text(
                'Home',
                style: TextStyle(
                  color: AppColor.black10,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
