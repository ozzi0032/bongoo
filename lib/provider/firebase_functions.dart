import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bongoo/model/user_model.dart';
import 'package:bongoo/model/alarm_model.dart';
import 'package:bongoo/utils/appConstants.dart';

class FirebaseFunctions {
  static Firestore db = Firestore.instance;

  static Future addUser(UserModel obj) async {
    DocumentReference dr =
        db.collection(AppConstants.bellID).document(obj.userId);
    await dr.setData(obj.toJSON(obj));
  }

  static Future getUser(String email) async {
    DocumentReference dr = db.collection('Users').document(email);
    return dr.get();
  }

  static Future<bool> verifyBellId(String id) async {
    try {
      var snapshot = await db
          .collection("bell_IDs")
          .where("id", isEqualTo: id)
          .limit(1)
          .getDocuments();

      if (snapshot.documents.length > 0)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> doesUserExist(String uid) async {
    try {
      var snapshot = await db
          .collection(AppConstants.bellID)
          .where("userId", isEqualTo: uid)
          .limit(1)
          .getDocuments();

      if (snapshot.documents.length > 0)
        return true;
      else
        return false;
    } catch (e) {
      return false;
    }
  }
  // static addAlarm(Map<String, dynamic> alarmMap) async {
  //   DocumentReference doc = db.collection("bell_01").document("alarm").collection("Alarms").document("123");
  //   print(alarmMap);
  //   doc.updateData(alarmMap).whenComplete(() {
  //     print("=========================");
  //     print("Data written in db via MAP");
  //     print("=========================");
  //   });
  // }

  static addAlarmMonday(AlarmModel monday) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Monday");
    doc.setData(monday.toJSON(monday)).whenComplete(() {
      print("=========================");
      print("Alarm Added Monday");
      print("=========================");
    });
  }

  static addAlarmTuesday(AlarmModel tuesday) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Tuesday");
    doc.setData(tuesday.toJSON(tuesday)).whenComplete(() {
      print("=========================");
      print("Alarm Added Tuesday");
      print("=========================");
    });
  }

  static addAlarmWednesday(AlarmModel wed) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Wednesday");
    doc.setData(wed.toJSON(wed)).whenComplete(() {
      print("=========================");
      print("Alarm Added Wednesday");
      print("=========================");
    });
  }

  static addAlarmThursday(AlarmModel thur) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Thursday");
    doc.setData(thur.toJSON(thur)).whenComplete(() {
      print("=========================");
      print("Alarm Added Thursday");
      print("=========================");
    });
  }

  static addAlarmFriday(AlarmModel fri) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Friday");
    doc.setData(fri.toJSON(fri)).whenComplete(() {
      print("=========================");
      print("Alarm Added Friday");
      print("=========================");
    });
  }

  static addAlarmSaturday(AlarmModel sat) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Saturday");
    doc.setData(sat.toJSON(sat)).whenComplete(() {
      print("=========================");
      print("Alarm Added Saturday");
      print("=========================");
    });
  }

  static addAlarmSunday(AlarmModel sun) async {
    DocumentReference doc = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document("Sunday");
    doc.setData(sun.toJSON(sun)).whenComplete(() {
      print("=========================");
      print("Alarm Added Sunday");
      print("=========================");
    });
  }

  static removeAlarm(String id) {
    DocumentReference ref = db
        .collection(AppConstants.bellID)
        .document("alarm")
        .collection("Alarms")
        .document(id);
    ref.delete();
  }

  static setEmergency(bool flag) async {
    DocumentReference doc =
        db.collection(AppConstants.bellID).document("emergencyAlarm");
    await doc.updateData({
      'isActive': flag,
    }).whenComplete(() {});
  }
}
