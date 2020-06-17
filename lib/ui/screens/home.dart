import 'package:bongoo/ui/widgets/platform-widgets/platform_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        isAppBar: false,
        child: Center(
          child: Text('This is home page'),
        ));
  }
}
