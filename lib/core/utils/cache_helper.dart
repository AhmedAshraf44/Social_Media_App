import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> setData<T>(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return await _prefs.setString(key, value);
    }
    return await _prefs.setBool(key, value);
  }

  static dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await _prefs.remove(key);
  }
}
