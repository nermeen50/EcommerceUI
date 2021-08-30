import 'package:flutter/material.dart';
import 'package:test_ecommerce/screens/forgetScreen.dart';
import 'package:test_ecommerce/screens/homeScreen.dart';
import 'package:test_ecommerce/screens/loginSuccess.dart';
import 'package:test_ecommerce/screens/signIn.dart';
import 'package:test_ecommerce/screens/signUpScreen.dart';
import 'package:test_ecommerce/screens/splashScreen.dart';
import 'package:test_ecommerce/screens/tabsPage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SignInScreen.routName: (context) => SignInScreen(),
  LoginSuccess.routeName: (context) => LoginSuccess(),
  ForgetScreen.routeName: (context) => ForgetScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TabsPage.routeName: (context) => TabsPage(),
};
