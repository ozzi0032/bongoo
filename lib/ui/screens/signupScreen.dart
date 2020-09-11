import 'package:bongoo/model/user_model.dart';
import 'package:bongoo/provider/firebase_functions.dart';
import 'package:bongoo/ui/screens/loginScreen.dart';
import 'package:bongoo/ui/widgets/appInputField-widget.dart';
import 'package:bongoo/utils/appConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:progress_dialog/progress_dialog.dart';
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
  ProgressDialog pr;
  TextEditingController _bellCodeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context);
    pr.style(
      message: "Signing up.....",
      progressWidget: CircularProgressIndicator(),
    );
    return Scaffold(
        backgroundColor: const Color(0xff8dc1d1),
        body: Form(
          key: formKey,
          child: ListView(
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
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: AppCustomTextField(
                  labelText: AppConstants.bellIdTextFieldLabel,
                  keyboardType: TextInputType.emailAddress,
                  controller: _bellCodeController,
                  hasValidation: true,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: AppCustomTextField(
                  labelText: AppConstants.emailTextFieldLabel,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  hasValidation: true,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: AppCustomTextField(
                  labelText: AppConstants.confirmEmailTextFieldLabel,
                  keyboardType: TextInputType.emailAddress,
                  controller: _confirmEmailController,
                  hasValidation: true,
                  subStr: _emailController.text,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: AppCustomTextField(
                  labelText: AppConstants.passwordTextFieldLabel,
                  obscure: true,
                  keyboardType: TextInputType.text,
                  controller: _passwordController,
                  hasValidation: true,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: AppCustomTextField(
                  labelText: AppConstants.confirmPasswordTextFieldLabel,
                  obscure: true,
                  keyboardType: TextInputType.text,
                  controller: _confirmPasswordController,
                  hasValidation: true,
                  subStr: _passwordController.text,
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
                    GestureDetector(
                        onTap: () {
                          userSignup();
                        },
                        child: Container(
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
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  userSignup() async {
    if (formKey.currentState.validate()) {
      pr.show();
      var _bellIdExists = await FirebaseFunctions.verifyBellId(
          _bellCodeController.text.toString());
      if (_bellIdExists) {
        try {
          FirebaseUser user = (await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text))
              .user;
          _addUserToDB(user.uid); //To keep record of user information
          pr.hide();
          _successDialog();
        } catch (e) {
          pr.hide();
          _errorDialog(e.code);
        }
      } else
        pr.hide();
      _errorDialog('Invalid Bell Code');
    }
  }

  _addUserToDB(String uid) async {
    UserModel user = new UserModel();
    user.bellId = _bellCodeController.text;
    user.email = _emailController.text;
    user.userId = uid;
    await FirebaseFunctions.addUser(user);
  }

  _successDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Success"),
              content: Text("Registration successful"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                )
              ],
            ));
  }

  _errorDialog(String error) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Error"),
              content: Text(error),
              actions: <Widget>[
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
