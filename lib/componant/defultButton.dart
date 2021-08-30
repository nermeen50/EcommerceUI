import 'package:flutter/material.dart';
import 'package:test_ecommerce/constants.dart';

class DefultButton extends StatelessWidget {
  final String buttonText;
  final Function buttonPress;
  const DefultButton({Key key, this.buttonText, this.buttonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: buttonPress,
      padding: EdgeInsets.all(15.0),
      child: Text(
        buttonText,
      ),
      textColor: whiteColor,
      color: mainColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
