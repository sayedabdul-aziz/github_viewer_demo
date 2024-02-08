import 'package:shared_preferences/shared_preferences.dart';

class AppLocal {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  cacheData(String key, value) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
    } else {
      await sharedPreferences.setDouble(key, value);
    }
  }

  getData(String key) {
    return sharedPreferences.get(key);
  }
}
