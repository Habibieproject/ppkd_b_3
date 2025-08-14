import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String loginKey = "login";
  static void saveLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginKey, true);
  }

  static getLogin() async {
    print(loginKey);
    final prefs = await SharedPreferences.getInstance();
    prefs.getBool(loginKey);
    return prefs.getBool(loginKey);
  }

  static void removeLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(loginKey);
  }
}
