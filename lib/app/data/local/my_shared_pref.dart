import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/translations/localization_service.dart';

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

  /// clear all data from shared pref
  static Future<void> clear() async => await _sharedPreferences.clear();

  /// check onBoarding status
  static Future<bool> setOnBoardingStatus(bool status) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(isOnBoardingChecked, status);
  }
  static Future<bool> getOnBoardingStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(isOnBoardingChecked) ?? false;
  }

  /// check user login status
  static Future<bool> setLoginStatus(bool status) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(isLoggedIn, status);
  }

  static Future<bool> getLoginStatus() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(isLoggedIn) ?? false;
  }

  /// set and get user ID
  static Future<bool> setUserId(String id) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(userId, id);
  }

  static Future<String?> getUserId() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(userId);
  }

///saved jwt
static Future<bool> setRefreshToken(String value) async {
  final localBD=await SharedPreferences.getInstance();
  return localBD.setString(refreshTokenKey, value);
}
static Future<String?> getRefreshToken() async {
  final localBD=await SharedPreferences.getInstance();
  return localBD.getString(refreshTokenKey);
}
}