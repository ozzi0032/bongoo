import 'package:bongoo/ui/widgets/appInputField-widget.dart';
import 'package:bongoo/utils/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({
    Key key,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _bellCodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

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
              labelText: AppConstants.bellIdTextFieldLabel,
              keyboardType: TextInputType.emailAddress,
              controller: _bellCodeController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: AppConstants.emailTextFieldLabel,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: AppConstants.confirmEmailTextFieldLabel,
              keyboardType: TextInputType.emailAddress,
              controller: _confirmEmailController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: AppConstants.passwordTextFieldLabel,
              obscure: true,
              keyboardType: TextInputType.text,
              controller: _passwordController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: AppCustomTextField(
              labelText: AppConstants.confirmPasswordTextFieldLabel,
              obscure: true,
              keyboardType: TextInputType.text,
              controller: _confirmPasswordController,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
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
