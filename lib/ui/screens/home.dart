import 'package:bongoo/ui/screens/emergencyFragment.dart';
import 'package:bongoo/ui/screens/notificationFragment.dart';
import 'package:flutter/material.dart';
import './alarmFragment.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.access_alarm),
                  text: "Alarm",
                ),
                Tab(
                  icon: Icon(Icons.phonelink_ring),
                  text: "Emergency",
                ),
                Tab(icon: Icon(Icons.notifications), text: "Notifications"),
              ],
            ),
            title: Text('Home'),
            backgroundColor: const Color(0xff98cdb5),
          ),
          body: TabBarView(
            children: [
              AlarmFragment(),
              EmergencyFragment(),
              NotificationFragment(),
            ],
          ),
        ),
      ),
    );
  }
}
