import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AlertManagement {
static void subscribeBell(){
    FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    firebaseMessaging.subscribeToTopic('BongoAlerts');
    print("Subscribed");
}

static void unSubscribeBell(){
    FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
    firebaseMessaging.unsubscribeFromTopic('BongoAlerts');
        print("UnSubscribed");

}

}