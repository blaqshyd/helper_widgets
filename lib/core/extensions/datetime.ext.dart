extension DateUtil on DateTime {
  String get formatToDate {
    return "$year-$month-$day";
  }

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
