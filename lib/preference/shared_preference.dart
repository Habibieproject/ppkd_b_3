import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String loginKey = "login";
  static const String tokenKey = "token";

  static void saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, true);
  }

  static void saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(tokenKey, token);
  }

  static getLogin() async {
    print(loginKey);
    final prefs = await SharedPreferences.getInstance();
    prefs.getBool(loginKey);
    return prefs.getBool(loginKey);
  }

  static getToken() async {
    print(tokenKey);
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(tokenKey);
    return prefs.getString(tokenKey);
  }

  static void removeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginKey);
  }

  static void removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(tokenKey);
  }
}
