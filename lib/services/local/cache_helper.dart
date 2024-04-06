import 'package:helper/core/extensions/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
    'Cache Init'.log();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await prefs.setString(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is double) return await prefs.setDouble(key, value);
    return await prefs.setBool(key, value);
  }

  static dynamic getData(String key) {
    return prefs.get(key);
  }

  static Future<bool> removeData(String key) async {
    return await prefs.remove(key);
  }

  static Future<bool> cleareAll() async {
    return await prefs.clear();
  }
}
