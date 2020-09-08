import 'package:bongoo/provider/firebase_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bongoo/model/alarm_model.dart';

class AlarmFragment extends StatefulWidget {
  @override
  _AlarmFragmentState createState() => _AlarmFragmentState();
}

class _AlarmFragmentState extends State<AlarmFragment> {
  bool _monday = false;
  bool _tuesday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  bool _saturday = false;
  bool _sunday = false;
  List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  String _fromTime = '12,00';
  String _toTime = '00,00';

  String fromSubtitle = DateTime.now().toString();
  String toSubtitle = DateTime.now().toString();

  Firestore db = Firestore.instance;

  Map<String, dynamic> alarmMap = {
    'Monday': null,
    'Tuesday': null,
    'Wednesday': null,
    'Thursday': null,
    'Friday': null,
    'Saturday': null,
    'Sunday': null,
  };
  List<dynamic> mondayList = List<dynamic>();
  List<dynamic> tuesdayList = List<dynamic>();
  List<dynamic> wednesdayList = List<dynamic>();
  List<dynamic> thursdayList = List<dynamic>();
  List<dynamic> fridayList = List<dynamic>();
  List<dynamic> saturdayList = List<dynamic>();
  List<dynamic> sundayList = List<dynamic>();
  _setAlarm() {
    if (_monday) {
      mondayList = List<dynamic>();
      AlarmModel monObj = new AlarmModel();
      mondayList.add(monObj.isActive = true);
      mondayList.add(monObj.day = 'Monday');
      mondayList.add(monObj.from = _fromTime);
      mondayList.add(monObj.to = _toTime);
      alarmMap.update('Monday', (value) => mondayList,
          ifAbsent: () => mondayList);
    }
    if (_tuesday) {
      tuesdayList = List<dynamic>();
      AlarmModel tueObj = new AlarmModel();
      tuesdayList.add(tueObj.isActive = true);
      tuesdayList.add(tueObj.day = 'Tuesday');
      tuesdayList.add(tueObj.from = _fromTime);
      tuesdayList.add(tueObj.to = _toTime);
      alarmMap.update('Tuesday', (value) => tuesdayList,
          ifAbsent: () => tuesdayList);
    }
    if (_wednesday) {
      wednesdayList = List<dynamic>();
      AlarmModel wedObj = new AlarmModel();
      wednesdayList.add(wedObj.isActive = true);
      wednesdayList.add(wedObj.day = 'Wednesday');
      wednesdayList.add(wedObj.from = _fromTime);
      wednesdayList.add(wedObj.to = _toTime);
      alarmMap.update('Wednesday', (value) => wednesdayList,
          ifAbsent: () => wednesdayList);
    }
    if (_thursday) {
      thursdayList = List<dynamic>();
      AlarmModel thurObj = new AlarmModel();
      thursdayList.add(thurObj.isActive = true);
      thursdayList.add(thurObj.day = 'Thursday');
      thursdayList.add(thurObj.from = _fromTime);
      thursdayList.add(thurObj.to = _toTime);
      alarmMap.update('Thursday', (value) => thursdayList,
          ifAbsent: () => thursdayList);
    }
    if (_friday) {
      fridayList = List<dynamic>();
      AlarmModel friObj = new AlarmModel();
      fridayList.add(friObj.isActive = true);
      fridayList.add(friObj.day = 'Friday');
      fridayList.add(friObj.from = _fromTime);
      fridayList.add(friObj.to = _toTime);
      alarmMap.update('Friday', (value) => fridayList,
          ifAbsent: () => fridayList);
    }
    if (_saturday) {
      saturdayList = List<dynamic>();
      AlarmModel satObj = new AlarmModel();
      saturdayList.add(satObj.isActive = true);
      saturdayList.add(satObj.day = 'Saturday');
      saturdayList.add(satObj.from = _fromTime);
      saturdayList.add(satObj.to = _toTime);
      alarmMap.update('Saturday', (value) => saturdayList,
          ifAbsent: () => saturdayList);
    }
    if (_sunday) {
      sundayList = List<dynamic>();
      AlarmModel sunObj = new AlarmModel();
      sundayList.add(sunObj.isActive = true);
      sundayList.add(sunObj.day = 'Sunday');
      sundayList.add(sunObj.from = _fromTime);
      sundayList.add(sunObj.to = _toTime);
      alarmMap.update('Sunday', (value) => sundayList,
          ifAbsent: () => sundayList);
    }
    FirebaseFunctions.addAlarm(alarmMap);
  }

  _showModalBottomSheet() {
    showModalBottomSheet(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext ctx, StateSetter setModalState) {
            return Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: _modalBottomSheetBody(setModalState));
          });
        });
  }

  _modalBottomSheetBody(StateSetter setModalState) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                //_setAlarm();
                _setAlarm();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        ListTile(
          title: Text('From'),
          subtitle: Text(fromSubtitle),
          trailing: Icon(Icons.access_time),
          onTap: () {
            DatePicker.showTimePicker(context,
                theme: DatePickerTheme(
                  containerHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                showTitleActions: true, onConfirm: (time) {
              print('***************************************from $time');
              _fromTime = '${time.hour},${time.minute}';
              setModalState(() {
                fromSubtitle = time.toString();
              });
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
        ),
        ListTile(
          title: Text('To'),
          subtitle: Text(toSubtitle),
          trailing: Icon(Icons.access_time),
          onTap: () {
            DatePicker.showTimePicker(context,
                theme: DatePickerTheme(
                  containerHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                showTitleActions: true, onConfirm: (time) {
              print('***************************************too $time');
              _toTime = '${time.hour},${time.minute}';
              setModalState(() {
                toSubtitle = time.toString();
              });
            }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
        ),
        // Days Widget
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_monday) {
                    _monday = false;
                  } else
                    _monday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _monday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Mon',
                  style: TextStyle(
                      color: _monday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_tuesday) {
                    _tuesday = false;
                  } else
                    _tuesday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _tuesday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Tue',
                  style: TextStyle(
                      color: _tuesday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_wednesday) {
                    _wednesday = false;
                  } else
                    _wednesday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _wednesday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Wed',
                  style: TextStyle(
                      color: _wednesday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_thursday) {
                    _thursday = false;
                  } else
                    _thursday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _thursday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Thur',
                  style: TextStyle(
                      color: _thursday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_friday) {
                    _friday = false;
                  } else
                    _friday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _friday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Fri',
                  style: TextStyle(
                      color: _friday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_saturday) {
                    _saturday = false;
                  } else
                    _saturday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _saturday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Sat',
                  style: TextStyle(
                      color: _saturday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                setModalState(() {
                  if (_sunday) {
                    _sunday = false;
                  } else
                    _sunday = true;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: _sunday ? Colors.blueAccent : null,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.grey[300],
                    )),
                child: Center(
                    child: Text(
                  'Sun',
                  style: TextStyle(
                      color: _sunday ? Colors.white : Colors.grey[300],
                      fontSize: 12),
                )),
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: db.collection("bell_01").document("alarm").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Server Error!");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: <Widget>[
                  Container(child: Center(child: CircularProgressIndicator()))
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: 7,
                  itemBuilder: (ctx, index) {
                    var currentItem = snapshot.data[weekDays[index]];
                    return ExpansionTile(
                      title: Text(currentItem[1]),
                      children: <Widget>[
                        ListTile(
                          title: Text('From'),
                          subtitle: Text(currentItem[2]),
                          trailing: Icon(Icons.access_time),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('To'),
                          subtitle: Text(currentItem[3]),
                          trailing: Icon(Icons.access_time),
                          onTap: () {},
                        ),
                        Center(
                            child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "Remove Alarm",
                                  style: TextStyle(color: Colors.red),
                                )))
                      ],
                    );
                  });
            }
          }),
      //-----------------------------
      floatingActionButton: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: const Color(0xff98cdb5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )),
        child: IconButton(
          onPressed: () {
            _showModalBottomSheet();
          },
          color: Colors.white,
          icon: Icon(Icons.add),
          iconSize: 30,
        ),
      ),
    );
  }
}
