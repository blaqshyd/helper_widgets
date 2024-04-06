import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateUtil on DateTime {
  String get asYyMmDd => '$this'.split(' ').first;
  String get formatToDate => "$year-$month-$day";

  String get toDatewithoutSlashes => DateFormat('dd MMM yyyy').format(this);
  String get toDateWithFirstMonth => DateFormat('MMM dd yyyy').format(this);
  String get toDateWithSlashes => DateFormat('dd/MM/yyyy').format(this);

  String get formatToTime {
    String minuteString = minute.toString().padLeft(2, '0');
    return "$hour:$minuteString";
  }

  String get formatToTimePeriod {
    String period = this.hour < 12 ? 'AM' : 'PM';
    int hour = this.hour % 12;
    if (hour == 0) {
      hour = 12;
    }
    String minuteString = minute.toString().padLeft(2, '0');
    return "$hour:$minuteString $period";
  }

  String get formatTimeAgo {
    DateTime now = DateTime.now();
    Duration difference = now.difference(this);

    if (difference.inDays >= 2) {
      return "${difference.inDays}d ago";
    } else if (difference.inDays == 1) {
      return "1d";
    } else if (difference.inHours > 0) {
      return "${difference.inHours}h";
    } else if (difference.inMinutes >= 2) {
      return "${difference.inMinutes}m";
    } else if (difference.inMinutes == 1) {
      return "1m";
    } else {
      return "Just now";
    }
  }
}

extension DateFormatting on DateTime {
  String toDatewithoutSlashes() {
    final format = DateFormat('dd MMM yyyy');
    return format.format(this);
  }

  String toDateWithFirstMonth() {
    final format = DateFormat('MMM dd yyyy');
    return format.format(this);
  }

  String toDateWithSlashes() {
    final format = DateFormat('dd/MM/yyyy');
    return format.format(this);
  }
}

extension TimeOfDayPlus on TimeOfDay {
  String get formattedWithPeriod =>
      '${"$hourOfPeriod".padLeft(2, "0")}:${"$minute".padLeft(2, "0")} '
      '${period.name.toUpperCase()}';

  String get formatted =>
      '${"$hour".padLeft(2, "0")}:${"$minute".padLeft(2, "0")}';
}
