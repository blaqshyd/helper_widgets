// random color
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

/// Generates random colors
Color generateRandomColor() {
  const List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lime,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepPurple,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  return colors[Random().nextInt(colors.length)];
}

/// Generates random uId
String generateRandomId({int length = 16}) {
  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random.secure();

  return List.generate(length, (index) {
    final randomIndex = random.nextInt(charset.length);
    return charset[randomIndex];
  }).join();
}

/// Launces a url with the url_launcher package
void openUrl({String? url}) {
  launchUrl(Uri.parse("http://$url"));
}

/// Launches gmail app
void openMailApp({String? receiver, String? title, String? body}) {
  launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
}

final formatCurrency = NumberFormat.simpleCurrency(
  locale: Platform.localeName,
  name: 'NGN',
);

/// Formats the amount and returns a formatted amount

String formatPrice(String amount) =>
    formatCurrency.format(num.parse(amount)).toString();

/// likeCountFormatter
/// * Format numbers like instagram
/// * Add
///
String likeCountFormmater(int number) {
  if (number < 2000) {
    return number.toString();
  } else if (number < 1000000) {
    double result = number / 1000;
    return '${result.toStringAsFixed(1)}K';
  } else if (number < 1000000000) {
    double result = number / 1000000;
    return '${result.toStringAsFixed(1)}M';
  } else {
    double result = number / 1000000000;
    return '${result.toStringAsFixed(1)}B';
  }
}
