import 'package:flutter/material.dart';

const mainColor = Color(0xFFff3b00);
const primaryColor = Color(0xFF9a938a);
const whiteColor = Color(0xFFffffff);
const kSecondaryColor = Color(0xFFe6dede);
const faceBookColor = Color(0xFF2610a0);
const twitterColor = Color(0xFF0073c5);
// Form Error
final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final passwordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
