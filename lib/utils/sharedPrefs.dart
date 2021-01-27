import 'package:bongoo/model/user_model.dart';
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

  static void setAppAlerts(bool alertOnOff) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(AppConstants.appAlert, alertOnOff);
    TopicSubscription.appAlert = alertOnOff;
  }
  static Future<bool> getAppAlerts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSub = prefs.getBool(AppConstants.appAlert);
    TopicSubscription.appAlert = isSub;
   if(isSub != null){
      return isSub;
    }else {
     return true;
    }
    // return isSub;
  }
}
