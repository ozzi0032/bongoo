import 'package:bongoo/provider/firebase_functions.dart';
import 'package:bongoo/utils/notificationManagement.dart';
import 'package:bongoo/utils/sharedPrefs.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationFragment extends StatefulWidget {
  @override
  _NotificationFragmentState createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  
  bool _switchValue;
@override
  void initState() {
    super.initState();
  _switchValue = getAlertValue();
//   SharedPrefs.getAppAlerts().then((value) {
//    setState(() {
//         _switchValue = value;
//         print("alert settings value is == "+ _switchValue.toString());
//       });
//  });
  }

 getAlertValue(){
  //_switchValue = FirebaseFunctions.getBellAlert();
//   FirebaseFunctions.getBellAlert().then((value){
//          setState(() {      _switchValue = value;
//         print("alert settings from firestore is == "+ _switchValue.toString());
//       }); 
//  });
  
  

 SharedPrefs.getAppAlerts().then((value) {
   setState(() {
        _switchValue = value;
        print("alert settings value is == "+ _switchValue.toString());
      });
 });
}

void _onChangedAppAlerts(bool value) async {
    if (value) {
      print("Subscribed App Alerts");
      FirebaseFunctions.setBellAlert(value);
      setState(() => AlertManagement.subscribeBell());
      SharedPrefs.setAppAlerts(value);
    } else {
      print("Unsubscribed App Aperts");
      FirebaseFunctions.setBellAlert(value);
      setState(() => AlertManagement.unSubscribeBell());
      SharedPrefs.setAppAlerts(value);
    }
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: 
      // ListView(
      //   children: <Widget>[
         Container(
          // color: Colors.red,
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height/2*.2,
           child: //Text("sdfsdfsd"),
          ListTile(
            leading: Container(
              height: 90,
           width:  MediaQuery.of(context).size.width/2,
                        // color: Colors.yellow,

              child:Text('Get notified about the bell ringing')),
            trailing: Container(
              height: MediaQuery.of(context).size.height/2*.2,
              width: 60,
                        //  color: Colors.yellow,

              child:Switch(
              value: _switchValue,
                onChanged: (val) {
               _switchValue = val;
              setState(() {
              _onChangedAppAlerts(val);
               });
            },
          )),
            )
            )
          // SwitchListTile(
          //   title: Text('Get notified about the bell ringing'),
          //   value: _switchValue,
          //   onChanged: (val) {
          //      _switchValue = val;
          //     setState(() {
          //     _onChangedAppAlerts(val);
          //      });
          //   },
          // )
      //   ],
      // ),
    );
  }
}
