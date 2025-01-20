import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';
import '../../modules/user_profile/model/user_model.dart';

class MySharedPref {
  // prevent making instance
  MySharedPref._();

  // get storage
  static late SharedPreferences _sharedPreferences;

  // STORING KEYS
  static const String _accessTokenKey = 'access_token';
  static const String _currentLocalKey = 'current_local';
  static const String _lightThemeKey = 'is_theme_light';
  static const String refreshTokenKey='refresh_token';
  static const String isLoggedIn = 'isLoggedIn';
  static const String isOnBoardingChecked = 'isOnBoardingChecked';
  static const String userId = 'adminId';
  static const String userData = 'user-data';

  /// init get storage services
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setStorage(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
  }

  /// set theme current type as light theme
  static Future<void> setThemeIsLight(bool lightTheme) =>
      _sharedPreferences.setBool(_lightThemeKey, lightTheme);

  /// get if the current theme type is light
  static bool getThemeIsLight() =>
      _sharedPreferences.getBool(_lightThemeKey) ?? true; // todo set the default theme (true for light, false for dark)

  /// save current locale
  static Future<void> setCurrentLanguage(String languageCode) =>
      _sharedPreferences.setString(_currentLocalKey, languageCode);

  /// get current locale
  static Locale getCurrentLocal(){
      String? langCode = _sharedPreferences.getString(_currentLocalKey);
      // default language is english
      if(langCode == null){
        return LocalizationService.defaultLanguage;
      }
      return LocalizationService.supportedLanguages[langCode]!;
  }

  /// save generated access token
  static Future<void> setAccessToken(String token) =>
      _sharedPreferences.setString(_accessTokenKey, token);

  /// get authorization token
  static String? getAccessToken() =>
      _sharedPreferences.getString(_accessTokenKey);
  /// remove access token
  static Future<bool> clearAccessToken() =>
      _sharedPreferences.remove(_accessTokenKey);

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();

  /// check onBoarding status
  static Future<bool> setOnBoardingStatus(bool status) async {
    return _sharedPreferences.setBool(isOnBoardingChecked, status);
  }
  static Future<bool> getOnBoardingStatus() async {
    return _sharedPreferences.getBool(isOnBoardingChecked) ?? false;
  }

  /// check user login status
  static Future<bool> setLoginStatus(bool status) async {
    return _sharedPreferences.setBool(isLoggedIn, status);
  }

  static Future<bool> getLoginStatus() async {
    return _sharedPreferences.getBool(isLoggedIn) ?? false;
  }

  /// set and get user ID
  static Future<bool> setUserId(String id) async {
    return _sharedPreferences.setString(userId, id);
  }
  static Future<String?> getUserId() async {
    return _sharedPreferences.getString(userId);
  }
  /// remove userId token
  static Future<bool> clearUserId() =>
      _sharedPreferences.remove(userId);

///saved jwt
static Future<bool> setRefreshToken(String value) async {
  return _sharedPreferences.setString(refreshTokenKey, value);
}
static Future<String?> getRefreshToken() async {
  return _sharedPreferences.getString(refreshTokenKey);
}
  /// remove refresh token
  static Future<bool> clearRefreshToken() =>
      _sharedPreferences.remove(refreshTokenKey);


/// user data UserModel
  // Save UserData to SharedPreferences
  static Future<void> saveUser(UserModel user) async {
    String userJson = jsonEncode(user.toJson()); // Convert UserModel to JSON string
    await _sharedPreferences.setString(userData, userJson);
  }
  // Retrieve UserModel from SharedPreferences
  static Future<UserModel?> getUser() async {
    String? userJson = _sharedPreferences.getString(userData); // Retrieve JSON string
    if (userJson == null) return null; // Return null if no data found
    return UserModel.fromJson(jsonDecode(userJson)); // Convert JSON string back to UserModel
  }
  // Remove UserModel from SharedPreferences
  static Future<void> clearUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userData);
  }
}