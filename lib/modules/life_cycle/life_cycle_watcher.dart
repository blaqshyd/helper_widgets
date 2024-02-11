import 'package:flutter/material.dart';

class LifecycleWatcher extends StatefulWidget {
  const LifecycleWatcher({super.key});

  @override
  State<LifecycleWatcher> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher>
    with WidgetsBindingObserver {
  AppLifecycleState? _lastLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    setState(() {
      _lastLifecycleState = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_lastLifecycleState == null) {
      return const Scaffold(
        body: Center(
          child: Text(
            'This widget has not observed any lifecycle changes.',
            textDirection: TextDirection.ltr,
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Text(
          'The most recent lifecycle state this widget observed was: $_lastLifecycleState.',
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
