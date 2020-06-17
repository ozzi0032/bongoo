import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bongoo/model/user_model.dart';

class FirebaseFunctions {
  static Future addUser(UserModel obj) async {
    DocumentReference dr =
        Firestore.instance.collection('Users').document(obj.email);
    await dr.setData(obj.toJSON(obj));
  }

  static Future getUser(String email) async {
    DocumentReference dr =
        Firestore.instance.collection('Users').document(email);
    return dr.get();
  }
}
