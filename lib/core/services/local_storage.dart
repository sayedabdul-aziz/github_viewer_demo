import 'package:shared_preferences/shared_preferences.dart';

class AppLocal {
  AppLocal._();
  static cacheData(String key, value) async {
    final pref = await SharedPreferences.getInstance();
    if (value is bool) {
      await pref.setBool(key, value);
    } else if (value is String) {
      await pref.setString(key, value);
    } else {
      await pref.setDouble(key, value);
    }
  }

  static Future<bool> getData(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}
