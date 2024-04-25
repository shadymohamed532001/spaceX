import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalServices {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    // Handle List<Map<String, dynamic>> case
    if (value is List<Map<String, dynamic>>) {
      return await sharedPreferences.setString(
        key,
        json.encode(value), // Convert List to JSON string
      );
    }

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) {
    return sharedPreferences.remove(key);
  }
}
