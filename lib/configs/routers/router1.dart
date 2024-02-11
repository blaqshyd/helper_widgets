import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<T?> push<T>(Widget child) => Navigator.of(navigatorKey.currentContext!)
    .push(MaterialPageRoute(builder: (context) => child));

Future<T?> pushReplacement<T>(Widget child) =>
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacement(MaterialPageRoute(builder: (context) => child));

Future<void> pushAndRemoveUntil(Widget child) =>
    Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => child), (c) => false);
void pop<T>() => Navigator.of(navigatorKey.currentContext!).pop();
