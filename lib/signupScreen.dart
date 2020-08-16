import 'package:bongoo/ui/widgets/appInputField-widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8dc1d1),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Text(
            'Bongoo',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              textStyle: Theme.of(context).textTheme.bodyText2,
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
          Image(
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.4,
            image: AssetImage('assets/bell_icon.png'),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: 'Bell Code',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: 'Confirm Email',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: 'Password',
              obscure: true,
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: 'Confirm Password',
              obscure: true,
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white, width: 1.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.bodyText2,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  width: MediaQuery.of(context).size.width * 0.13,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: const Color(0xff8dc1d1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
