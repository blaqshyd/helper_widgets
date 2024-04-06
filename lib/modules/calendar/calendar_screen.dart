import 'package:flutter/material.dart';
import 'package:helper/modules/calendar/calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Calendar(),
      )),
    );
  }
}
