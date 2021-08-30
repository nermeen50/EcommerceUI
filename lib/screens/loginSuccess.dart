import 'package:flutter/material.dart';
import 'package:test_ecommerce/componant/defultButton.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/screens/tabsPage.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = '/login';
  const LoginSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Login success",
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
            Image.asset('assets/images/success.png'),
            Text(
              "Login success",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            DefultButton(
              buttonText: 'Back To Home',
              buttonPress: () {
                Navigator.pushNamed(context, TabsPage.routeName);
              },
            )
          ],
        )),
      ),
    );
  }
}
