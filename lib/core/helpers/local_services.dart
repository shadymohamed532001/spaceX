import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';

class LocalServices {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }



  static Future<bool> saveModel({
    required String key,
    required  value,
  }) async {
    final rocketJson = value.toJson();
    final rocketString = json.encode(rocketJson);
    return await sharedPreferences.setString(key, rocketString);
  }

  static  getModel({required String key}) {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      final rocketJson = json.decode(jsonString);
      return RocketModel.fromJson(rocketJson);
    }
    return null;
  }
  static Future<void> saveModelToLocalDatabase<T>(String key, T model) async {
    final jsonData = json.encode(model);
    await sharedPreferences.setString(key, jsonData);
  }

  static Future<List<T>> getModelFromLocalDatabase<T>(
      String key, T Function(Map<String, dynamic>) fromJson) async {
    final jsonString = sharedPreferences.getString(key);
    if (jsonString != null) {
      final jsonData = json.decode(jsonString) as List<dynamic>;
      final models = jsonData
          .map((data) => fromJson(data as Map<String, dynamic>))
          .toList();
      return models;
    }
    return [];
  }

  static Future<bool> removeModel({required String key}) {
    return sharedPreferences.remove(key);
  }
}

