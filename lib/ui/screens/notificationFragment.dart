import 'package:flutter/material.dart';

class NotificationFragment extends StatefulWidget {
  @override
  _NotificationFragmentState createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Get notified about the bell ringing'),
            value: true,
            onChanged: (val) {
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
