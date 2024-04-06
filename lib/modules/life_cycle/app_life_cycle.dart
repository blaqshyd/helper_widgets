import 'package:flutter/material.dart';
import 'package:helper/core/core.dart';

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
      onDetach: () => ('Detached').log(),
      onHide: () => ('Hidden').log(),
      onInactive: () => ('Inactive').log(),
      onRestart: () => ('Restart').log(),
      onResume: () => ('Resume').log(),
      onStateChange: (value) => (value).log(),
      onShow: () => ('Show').log(),
      onPause: () => ('Pause').log(),
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
