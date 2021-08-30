import 'package:flutter/material.dart';
import 'package:test_ecommerce/componant/defultAppBar.dart';
import 'package:test_ecommerce/componant/defultProfileCard.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/screens/homeScreen.dart';
import 'package:test_ecommerce/sizeConfig.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefultAppBar(
          leadingIcon: Icons.arrow_back,
          press: () {
            Navigator.pop(context, HomeScreen.routeName);
          },
          title: "Profile",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: getPropertScreenHeight(150),
                      width: getPropertScreenWidth(150),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Profile Image.png'),
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      bottom: 0.0,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kSecondaryColor,
                        ),
                        child: IconButton(
                          iconSize: 30.0,
                          icon: Icon(Icons.camera_alt),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getPropertScreenHeight(20),
                ),
                ProfileCard(
                  leadingIcon: Icons.person,
                  titleText: 'My Account',
                ),
                ProfileCard(
                  leadingIcon: Icons.notifications,
                  titleText: 'Notifications',
                ),
                ProfileCard(
                  leadingIcon: Icons.settings,
                  titleText: 'Setting',
                ),
                ProfileCard(
                  leadingIcon: Icons.help,
                  titleText: 'Help Center',
                ),
                ProfileCard(
                  leadingIcon: Icons.logout,
                  titleText: 'Log Out',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
