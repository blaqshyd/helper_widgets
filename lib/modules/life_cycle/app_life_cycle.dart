import 'package:flutter/material.dart';

class AppLifeCycle extends StatefulWidget {
  const AppLifeCycle({super.key});

  @override
  AppLifeCycleState createState() => AppLifeCycleState();
}

class AppLifeCycleState extends State<AppLifeCycle> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onDetach: () => ('Detached'),
      onHide: () => ('Hidden'),
      onInactive: () => ('Inactive'),
      onRestart: () => ('Restart'),
      onResume: () => ('Resume'),
      onStateChange: (value) => (value),
      onShow: () => ('Show'),
      onPause: () => ('Pause'),
    );
    setState(() {
      _listener;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_listener.onRestart == null ? 'Hello' : 'World'),
      ),
    );
  }
}
