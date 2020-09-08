import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bongoo/model/user_model.dart';

class FirebaseFunctions {
  static Firestore db = Firestore.instance;

  static Future addUser(UserModel obj) async {
    DocumentReference dr = db.collection('bell_01').document(obj.userId);
    await dr.setData(obj.toJSON(obj));
  }

  static Future getUser(String email) async {
    DocumentReference dr = db.collection('Users').document(email);
    return dr.get();
  }

  static addAlarm(Map<String, dynamic> alarmMap) async {
    DocumentReference doc = db.collection("bell_01").document("alarm").collection("Alarms").document("123");
    print(alarmMap);
    doc.updateData(alarmMap).whenComplete(() {
      print("=========================");
      print("Data written in db via MAP");
      print("=========================");
    });
  }

  static setEmergency(bool flag) async {
    DocumentReference doc = db.collection("bell_01").document("emergencyAlarm");
    await doc.updateData({
      'isActive': flag,
    }).whenComplete(() {
      print("=========================");
      print("Emergency Ringing alert Status");
      print("=========================");
    });
  }
}
