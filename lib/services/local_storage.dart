import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;
  static configurePrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String token) {
    if (token.isNotEmpty) {
      _prefs.setString('token', token.trim());
    }
  }
}