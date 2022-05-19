import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;
  static configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return prefs.getString('token') ?? '';
  }

  set token(String token) {
    if (token.isNotEmpty) {
      prefs.setString('token', token.trim());
    }
  }

  String get currentPage {
    return prefs.getString('currentPage') ?? '';
  }

  set currentPage(String currentPage) {
    if (currentPage.isNotEmpty) {
      prefs.setString('currentPage', currentPage.trim());
    }
  }



}
