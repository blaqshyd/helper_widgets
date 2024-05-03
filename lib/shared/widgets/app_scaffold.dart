// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:helper/core/core.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final Widget? drawer;
  final Widget title;
  final Widget bottomNav;
  final EdgeInsetsGeometry padding;
  final ListType<Widget>? actions;
  final Color? bgColor;

  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    this.hasDrawer = false,
    this.drawer,
    this.bottomNav = const SizedBox.shrink(),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    this.actions = const [],
    this.bgColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: hasDrawer ? drawer : null,
      bottomNavigationBar: bottomNav,
      appBar: AppBar(
        actions: actions,
        centerTitle: true,
        title: title,
        backgroundColor: bgColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}
