import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String expirationKey = 'expiration';

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(refreshTokenKey);
  }

  static Future<DateTime?> getExpiration() async {
    final prefs = await SharedPreferences.getInstance();
    final expirationTimestamp = prefs.getInt(expirationKey);
    return expirationTimestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(expirationTimestamp)
        : null;
  }

  static Future<void> saveTokens(
      String accessToken, String refreshToken, DateTime expiration) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, accessToken);
    await prefs.setString(refreshTokenKey, refreshToken);
    await prefs.setInt(expirationKey, expiration.millisecondsSinceEpoch);
  }

  static Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessTokenKey);
    await prefs.remove(refreshTokenKey);
    await prefs.remove(expirationKey);
  }
}
