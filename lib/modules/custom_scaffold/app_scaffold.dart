import 'package:flutter/material.dart';
import 'package:helper/common/common.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final Widget title;

  const AppScaffold({
    super.key,
    required this.body,
    this.hasDrawer = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hasDrawer ? const Drawer() : null,
      appBar: AppBar(
        actions: const [],
        centerTitle: true,
        title: title,
        backgroundColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: AppSizing.padding,
          child: body,
        ),
      ),
    );
  }
}
