import 'package:flutter/material.dart';

import '../constants.dart';

class DefultAppBar extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final Function press;
  const DefultAppBar({Key key, this.leadingIcon, this.title, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: press,
        icon: Icon(leadingIcon),
        color: primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(color: primaryColor),
      ),
    );
  }
}
