import "dart:developer" as dev_tools show log;
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

//! File Picker

extension FilePickerExtension on FilePickerResult {
  Future<File?> get asFile async {
    if (files.isNotEmpty) {
      final filePath = files.single.path;
      if (filePath != null) {
        return File(filePath);
      }
    }
    return null;
  }
}

extension ToFile on Future<XFile?> {
  Future<File?> toFile() => then((xFile) => xFile?.path).then(
        (filePath) => filePath != null ? File(filePath) : null,
      );
}

extension WidgetExtensions on num {
  Widget get sbH => SizedBox(height: toDouble());
  Widget get sbW => SizedBox(width: toDouble());

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get padA => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry pad({
    num left = 0.0,
    num right = 0.0,
    num top = 0.0,
    num bottom = 0.0,
  }) =>
      EdgeInsets.only(
        left: left.toDouble(),
        right: right.toDouble(),
        top: top.toDouble(),
        bottom: bottom.toDouble(),
      );
}

extension ImagePath on String {
  String get png => 'lib/assets/images/$this.png';
  String get jpg => 'lib/assets/images/$this.jpg';
  String get gif => 'lib/assets/images/$this.gif';
}

extension VectorPath on String {
  String get svg => 'lib/assets/vectors/$this.svg';
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  num addPercentage(num v) => this + ((v / 100) * this);
  num getPercentage(num v) => ((v / 100) * this);
}

//! LOG EXTENSION - THIS HELPS TO CALL A .log() ON ANY OBJECT
extension Log on Object {
  void log() => dev_tools.log(toString());
}

//! HELPS TO CALL A .dismissKeyboard ON A WIDGET
extension DismissKeyboard on Widget {
  void dismissKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}

const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

extension StringCasingExtension on String {
  String? camelCase() => toBeginningOfSentenceCase(this);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String? trimToken() => contains(":") ? split(":")[1].trim() : this;
  String? trimSpaces() => replaceAll(" ", "");
  String removeSpacesAndLower() => replaceAll(' ', '').toLowerCase();
}



void openUrl({String? url}) {
  launchUrl(Uri.parse("http://$url"));
}

void openMailApp({String? receiver, String? title, String? body}) {
  launchUrl(Uri.parse("mailto:$receiver?subject=$title&body=$body"));
}

//* Generates random uId
String generateRandomId({int length = 16}) {
  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random.secure();

  return List.generate(length, (index) {
    final randomIndex = random.nextInt(charset.length);
    return charset[randomIndex];
  }).join();
}




