import 'package:flutter/material.dart';
import 'package:test_ecommerce/constants.dart';

class ProfileCard extends StatelessWidget {
  final IconData leadingIcon;
  final String titleText;
  const ProfileCard({Key key, this.leadingIcon, this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      color: kSecondaryColor,
      child: ListTile(
        trailing: Icon(
          Icons.arrow_drop_down,
          color: primaryColor,
        ),
        leading: Icon(
          leadingIcon,
          color: mainColor,
        ),
        title: Text(
          titleText,
          style: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}
