import 'dart:io';

import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  ///isLogin
  static Future setIsLogIn(bool isLogin) async {
    await getStorage.write("isLogin", isLogin);
  }

  static getIsLogIn() {
    var isLogin = getStorage.read("isLogin");
    return isLogin ?? false;
  }

  ///isNotificationEnabled
  static Future setNotificationEnabled(bool isNotificationEnabled) async {
    await getStorage.write("isNotificationEnabled", isNotificationEnabled);
  }

  static getNotificationEnabled() {
    var isLogin = getStorage.read("isNotificationEnabled");
    return isLogin ?? false;
  }

  static Future setStringPref(String key, String value) async {
    await getStorage.write(key, value);
  }

  static getStringPref(String key) {
    return getStorage.read(key);
  }

  ///user token
  static Future setUserToken(String userToken) async {
    await getStorage.write("user_token", userToken);
  }

  static getUserToken() {
    return getStorage.read("user_token");
  }

  ///userName
  static Future setUserName(String userName) async {
    await getStorage.write("userName", userName);
  }

  static getUserName() {
    return getStorage.read("userName");
  }

  ///userPhone
  static Future setUserPhone(String userName) async {
    await getStorage.write("userPhone", userName);
  }

  static getUserPhone() {
    return getStorage.read("userPhone");
  }

  ///userCountryCode
  static Future setUserCountryCode(String userName) async {
    await getStorage.write("userCountryCode", userName);
  }

  static getUserCountryCode() {
    return getStorage.read("userCountryCode");
  }

  ///userImage
  static Future setUserProfile(File profiles) async {
    await getStorage.write("profileUser", profiles);
  }

  static getUserProfile() {
    return getStorage.read("profileUser");
  }

  ///userId
  static Future setUserId(String userId) async {
    await getStorage.write("userId", userId);
  }

  static getUserId() {
    return getStorage.read("userId");
  }

  ///userEmail
  static Future setUserEmail(String userEmail) async {
    await getStorage.write("userEmail", userEmail);
  }

  static getUserEmail() {
    return getStorage.read("userEmail");
  }

  ///device type
  static Future setDeviceType(String deviceType) async {
    await getStorage.write("deviceType", deviceType);
  }

  static getDeviceType() {
    return getStorage.read("deviceType");
  }

  /// Set the selected locale
  static Future<void> setLocale(String locale) async {
    await getStorage.write('locale', locale);
  }

  static String? getLocale() {
    String? localeString = getStorage.read('locale');
    if (localeString != null) {
      return localeString;
    }
    return "en";
  }

  static clearData() async => GetStorage().erase();
  // static Future setUser(signIn.Data user) async {
  //   await getStorage.write("user", user);
  // }
  //
  // static getUser() {
  //   return getStorage.read("user");
  // }
}
