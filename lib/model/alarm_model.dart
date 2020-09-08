import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmModel {
  bool isActive;
  String day;
  String from;
  String to;
  AlarmModel({
    this.isActive,
    this.day,
    this.from,
    this.to,
  });
  factory AlarmModel.fromFireStore(DocumentSnapshot doc) {
    Map data = doc.data;
    return AlarmModel(
      isActive: data[0],
      day: data[1],
      from: data[2],
      to: data[3],
    );
  }
}
