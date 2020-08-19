import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bongoo/model/user_model.dart';

class FirebaseFunctions {
 static Firestore db = Firestore.instance;

  static Future addUser(UserModel obj) async {
    DocumentReference dr =
        db.collection('bell_01').document(obj.userId);
    await dr.setData(obj.toJSON(obj));
  }

  static Future getUser(String email) async {
    DocumentReference dr =
        db.collection('Users').document(email);
    return dr.get();
  }

  static addAlarm(DateTime timeIn){
    List<dynamic> monday = List<dynamic>();
    List<dynamic> tuesday = List<dynamic>();
    List<dynamic> wednesday = List<dynamic>();
    List<dynamic> thursday = List<dynamic>();
    List<dynamic> friday = List<dynamic>();
    List<dynamic> saturday = List<dynamic>();
    List<dynamic> sunday = List<dynamic>();
    monday.add( true);
    monday.add("Monday");
    monday.add( timeIn);
    monday.add( timeIn);

tuesday.add( true);
tuesday.add("Tuesday");
    tuesday.add( timeIn);
    tuesday.add( timeIn);

    wednesday.add( true);
    wednesday.add("Wednesday");
    wednesday.add( timeIn);
    wednesday.add( timeIn);

    thursday.add( true);
    thursday.add("Thursday");
    thursday.add( timeIn);
    thursday.add( timeIn);

    friday.add( true);
    friday.add("Friday");
    friday.add( timeIn);
    friday.add( timeIn);

    saturday.add( true);
    saturday.add("Saturday");
    saturday.add( timeIn);
    saturday.add( timeIn);

     sunday.add( true);
     sunday.add("Sunday");
    sunday.add( timeIn);
    sunday.add( timeIn);



    DocumentReference doc = db.collection("bell_01").document("alarm");
   Map<String, dynamic> user ={
          'Monday': monday,
          'Tuesday': tuesday,
          'Wednesday': wednesday,
          'Thursday': thursday,
          'Friday': friday,
          'Saturday': saturday,
          'Sunday': sunday,          
          };
  doc.updateData(user).whenComplete((){
    print("=========================");
    print("Data written in db");
    print("=========================");
  });
  }

  

}
