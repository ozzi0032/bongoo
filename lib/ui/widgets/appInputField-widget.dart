import 'package:bongoo/utils/appConstants.dart';
import 'package:flutter/material.dart';

class AppCustomTextField extends StatefulWidget {
  final String labelText;
  final Color labelColor;
  final String subStr;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool hasValidation;
  AppCustomTextField(
      {@required this.labelText,
      this.labelColor = Colors.white,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.labelText,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.labelColor,
              fontSize: 14),
        ),
        SizedBox(
          height: 10,
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
    );
  }

  getValidatorMsg(String t, String value) {
    switch (t) {
      case AppConstants.bellIdTextFieldLabel:
        return value.length < 1 ? AppConstants.bellIdValidation : null;
        break;
      case AppConstants.emailTextFieldLabel:
        return !value.contains('@') ? AppConstants.emailValidation : null;
        break;
      case AppConstants.confirmEmailTextFieldLabel:
        return value != widget.subStr
            ? AppConstants.confirmEmailValidation
            : null;
        break;
      case AppConstants.passwordTextFieldLabel:
        return value.length < 8 ? AppConstants.passwordValidation : null;
        break;
      case AppConstants.confirmPasswordTextFieldLabel:
        return value != widget.subStr
            ? AppConstants.repeatPasswordValidation
            : null;
        break;
    }
    return null;
  }
}
