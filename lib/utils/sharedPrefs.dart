import 'package:bongoo/utils/appConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static void setLoginStatus(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences?.setBool(AppConstants.isLoggedIn, value);
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var status = preferences.getBool(AppConstants.isLoggedIn) ?? false;
    return status;
  }
}
