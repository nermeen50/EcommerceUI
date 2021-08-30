import 'package:flutter/material.dart';

class DefultTextField extends StatelessWidget {
  final String labelText, hintText;
  final Widget inputIcon, iconPrefix;
  final bool textObscure, fillBool;
  final Function valitateFunction, funcOnChange, funSaved;
  final Color colorFill;
  final TextEditingController controller;
  const DefultTextField(
      {Key key,
      this.labelText,
      this.hintText,
      this.inputIcon,
      this.textObscure,
      this.controller,
      this.funcOnChange,
      this.funSaved,
      this.iconPrefix,
      this.colorFill,
      this.fillBool,
      this.valitateFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valitateFunction,
      onChanged: funcOnChange,
      // onSaved: funSaved,
      obscureText: textObscure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        labelText: labelText,
        hintText: hintText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: inputIcon,
        prefixIcon: iconPrefix,
        filled: fillBool,
        fillColor: colorFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
    );
  }
}
