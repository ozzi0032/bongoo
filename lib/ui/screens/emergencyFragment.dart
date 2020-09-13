import 'package:bongoo/provider/firebase_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyFragment extends StatefulWidget {
  @override
  _EmergencyFragmentState createState() => _EmergencyFragmentState();
}

class _EmergencyFragmentState extends State<EmergencyFragment> {
  bool _alert = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Emergency Ringing'),
            activeColor: Colors.red,
            value: _alert,
            onChanged: (val) {
              setState(() {
                _alert = val;
                FirebaseFunctions.setEmergency(_alert);
              });
            },
          )
        ],
      ),
    );
  }
}
