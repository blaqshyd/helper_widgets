import 'package:flutter/material.dart';
import 'package:helper/core/app/my_app.dart';
import 'package:helper/services/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}
