import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

/// Push
Future<T?> push<T>(Widget child) => Navigator.of(navigatorKey.currentContext!)
    .push(MaterialPageRoute(builder: (context) => child));

/// Push replacement

Future<T?> pushReplacement<T>(Widget child) =>
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) => child));

/// Push and remove until
Future<void> pushAndRemoveUntil(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);

/// Pops the screen
void pop<T>() => Navigator.of(navigatorKey.currentContext!).pop();
