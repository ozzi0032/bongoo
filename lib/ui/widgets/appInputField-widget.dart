import 'package:flutter/material.dart';

class AppCustomTextField extends StatefulWidget {
  final String labelText;
  final String subStr;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hasValidation;
  AppCustomTextField(
      {@required this.labelText,
      this.subStr,
      this.controller,
      this.obscure = false,
      this.keyboardType = TextInputType.text,
      this.hasValidation = false});
  @override
  _AppCustomTextFieldState createState() => _AppCustomTextFieldState();
}

class _AppCustomTextFieldState extends State<AppCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.labelText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
              controller: widget.controller,
              obscureText: widget.obscure,
              keyboardType: widget.keyboardType,
              validator: (val) {
                return widget.hasValidation
                    ? getValidatorMsg(widget.labelText, val)
                    : null;
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  getValidatorMsg(String t, String value) {
    // switch (t) {
    //   case Constants.fnameTextFieldLabel:
    //     return !value.contains('') || value.length < 3
    //         ? Constants.fnameValidation
    //         : null;
    //     break;
    //   case Constants.lnameTextFieldLabel:
    //     return !value.contains('') || value.length < 3
    //         ? Constants.lnameValidation
    //         : null;
    //     break;
    //   case Constants.contactNumberTextFieldLabel:
    //     return !value.contains('') || value.length < 10
    //         ? Constants.contactNumberValidation
    //         : null;
    //     break;
    //   case Constants.emailTextFieldLabel:
    //     return !value.contains('@') ? Constants.emailValidation : null;
    //     break;
    //   case Constants.passwordTextFieldLabel:
    //     return value.length < 8 ? Constants.passwordValidation : null;
    //     break;
    //   case Constants.confirmPasswordTextFieldLabel:
    //     return value != widget.subStr
    //         ? Constants.repeatPasswordValidation
    //         : null;
    //     break;
    // }
    return null;
  }
}
