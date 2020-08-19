import 'package:bongoo/provider/firebase_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  String _time = 'Not set';
  Firestore db = Firestore.instance;
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
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        ListTile(
          title: Text('From'),
          trailing: Icon(Icons.access_time),
          onTap: () {
            DatePicker.showTimePicker(context,
                theme: DatePickerTheme(
                  containerHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                showTitleActions: true, 
                onConfirm: (time) {
                  // write in firestore here
                  FirebaseFunctions.addAlarm(time);
              print('confirm $time');
              _time = '${time.hour} : ${time.minute} : ${time.second}';
            }, currentTime: DateTime.now(), locale: LocaleType.en);
           
          },
        ),
        ListTile(
          title: Text('To'),
          trailing: Icon(Icons.access_time),
          onTap: () {},
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
