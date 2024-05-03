// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    this.bgColor,
    this.child,
    this.useMaterial3 = true,
    this.elevation,
  }) : assert(elevation == null || elevation >= 0.0);

  final double? elevation;
  final Color? bgColor;
  final Widget? child;
  final bool? useMaterial3;

  @override
  Widget build(BuildContext context) {
    return switch (useMaterial3) {
      false => Drawer(
          backgroundColor: bgColor,
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
            ],
          ),
        ),
      _ => NavigationDrawer(
          elevation: elevation,
          backgroundColor: bgColor,
          children: const <Widget>[
            DrawerHeader(
              child: FlutterLogo(
                style: FlutterLogoStyle.horizontal,
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.message),
              label: Text('Messages'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.account_circle),
              label: Text('Profile'),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
    };
  }
}
