import 'dart:convert';

import 'package:onboarding/common/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
singleton class to initialize only once
 */
class StrorageService {
  late final SharedPreferences _preferences;
  Future<StrorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }

  bool getLaunchStatus() {
    return _preferences.getBool(AppConstants.appLaunchFirstTime) ?? false;
  }

  bool getIsLoginStatus() {
    return _preferences.getString(AppConstants.userTokenKey) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }

  getUserProfile() {
    var userProfile = _preferences.get(AppConstants.userProfileKey);
    if (userProfile != null) {
      return jsonDecode(userProfile.toString());
    }
  }

  String getUserToken() {
    return _preferences.getString(AppConstants.userTokenKey)??"";
  }
}
