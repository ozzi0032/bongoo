import 'package:bongoo/ui/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bongoo',
      theme: ThemeData(
        textTheme: TextTheme(bodyText2: GoogleFonts.lato()),
      ),
      home: SplashScreen(),
    );
  }
}
