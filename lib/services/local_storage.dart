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

  String get userName {
    return prefs.getString('userName') ?? '';
  }

  set userName(String userName) {
    if (userName.isNotEmpty) {
      prefs.setString('userName', userName.trim());
    }
  }

  String get userID {
    return prefs.getString('userID') ?? '';
  }

  set userID(String userID) {
    if (userID.isNotEmpty) {
      prefs.setString('userID', userID.trim());
    }
  }



}
