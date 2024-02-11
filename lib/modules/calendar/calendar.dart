import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final CalendarFormat? calenderFormat;
  const Calendar({
    super.key,
    this.calenderFormat = CalendarFormat.month,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: today,
      firstDay: DateTime.utc(2020),
      lastDay: DateTime.utc(2030),
      selectedDayPredicate: (day) => isSameDay(day, today),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          today = selectedDay;
        });
      },
      sixWeekMonthsEnforced: false,
      calendarFormat: widget.calenderFormat!,
      rowHeight: 38,
      availableGestures: AvailableGestures.all,
      headerStyle: const HeaderStyle(
          headerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          formatButtonVisible: false,
          titleCentered: true,
          formatButtonPadding: EdgeInsets.symmetric(horizontal: 30)),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(fontSize: 14),
      ),
    );
  }
}
