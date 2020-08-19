import 'package:bongoo/UI/screens/signupScreen.dart';
import 'package:bongoo/ui/screens/home.dart';
import 'package:bongoo/ui/widgets/appInputField-widget.dart';
import 'package:bongoo/utils/appConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
   String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffecb65),
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
              labelText: AppConstants.usernameTextFieldLabel,
              keyboardType: TextInputType.emailAddress,
              controller: _usernameController,
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
          InkWell(
            onTap: () {
                userLogin();
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
            },
            child: Container(
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
                    'Login',
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
                      color: const Color(0xfffecb65),
                    ),
                  )
                  
                  
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext ctx) => SignupScreen()));
                },
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
   userLogin() async {
    
    //if (formKey.currentState.validate()) {
      try {
        final FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(
                    email: _usernameController.text, password: _passwordController.text))
            .user;
        //await setLoginSession(); //Setting bool value to keep user logged in
        
        //await setUserProfileInfo(user.email);
        
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => HomePage()));
      } catch (e) {
        switch (e.code) {
          case "ERROR_INVALID_EMAIL":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "ERROR_WRONG_PASSWORD":
            errorMessage = "Your password is wrong.";
            break;
          case "ERROR_USER_NOT_FOUND":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "ERROR_USER_DISABLED":
            errorMessage = "User with this email has been disabled.";
            break;
          case "ERROR_TOO_MANY_REQUESTS":
            errorMessage = "Too many requests. Try again later.";
            break;
          case "ERROR_OPERATION_NOT_ALLOWED":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        
        errorMessageDialog();
      //}
    }
   
  }
  
    errorMessageDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error! Cannot Login"),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
