import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ecommerce/componant/defultAppBar.dart';
import 'package:test_ecommerce/componant/defultButton.dart';
import 'package:test_ecommerce/componant/defultTextField.dart';
import 'package:test_ecommerce/componant/soicalMediaButton.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/screens/signIn.dart';
import 'package:test_ecommerce/sizeConfig.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/signUp';
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formvaliate = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  final List errors = [];
  void addItem({String item}) {
    if (!errors.contains(item)) {
      setState(() {
        errors.add(item);
      });
    }
  }

  void removeItem({String item}) {
    if (errors.contains(item)) {
      setState(() {
        errors.remove(item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefultAppBar(
          leadingIcon: Icons.arrow_back,
          press: () {
            Navigator.pop(context, SignInScreen.routName);
          },
          title: "SignUp",
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Register Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Complete your details or continue \nwith social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getPropertScreenHeight(20),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Form(
                      key: formvaliate,
                      child: Column(
                        children: [
                          DefultTextField(
                            funcOnChange: (val) {
                              if (val != null || val.isNotEmpty) {
                                removeItem(item: kEmailNullError);
                              } else if (emailRegExp.hasMatch(val)) {
                                removeItem(item: kInvalidEmailError);
                              }
                            },
                            valitateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                addItem(item: kEmailNullError);
                                return '';
                              } else if (!emailRegExp.hasMatch(value)) {
                                addItem(item: kInvalidEmailError);
                                return '';
                              }
                              return null;
                            },
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            inputIcon: Icon(Icons.email),
                            textObscure: false,
                          ),
                          SizedBox(
                            height: getPropertScreenHeight(10),
                          ),
                          DefultTextField(
                            controller: pass,
                            funcOnChange: (val) {
                              if (val != null || val.isNotEmpty) {
                                removeItem(item: kPassNullError);
                              } else if (val.length > 6) {
                                removeItem(item: kShortPassError);
                              }
                            },
                            valitateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                addItem(item: kPassNullError);
                                return '';
                              } else if (!passwordRegExp.hasMatch(value) &&
                                  value.length < 6) {
                                addItem(item: kShortPassError);
                                return '';
                              } else if (value != null || value.isNotEmpty) {
                                removeItem(item: kPassNullError);
                              } else if (value.length > 6) {
                                removeItem(item: kShortPassError);
                              }
                              return null;
                            },
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                            inputIcon: Icon(Icons.lock),
                            textObscure: true,
                          ),
                          SizedBox(
                            height: getPropertScreenHeight(10),
                          ),
                          DefultTextField(
                            funcOnChange: (val) {
                              if (val != null || val.isNotEmpty) {
                                removeItem(
                                    item: 'Please confirm your password');
                              } else if (val == pass.text) {
                                removeItem(item: kMatchPassError);
                              }
                            },
                            valitateFunction: (value) {
                              if (value == null || value.isEmpty) {
                                addItem(item: 'Please confirm your password');
                                return '';
                              } else if (value != pass.text) {
                                addItem(item: kMatchPassError);
                                return '';
                              } else if (value != null || value.isNotEmpty) {
                                removeItem(
                                    item: 'Please confirm your password');
                              } else if (value == pass.text) {
                                removeItem(item: kMatchPassError);
                              }
                              return null;
                            },
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter Your Password',
                            inputIcon: Icon(Icons.lock),
                            textObscure: true,
                          ),
                          Column(
                            children: List.generate(errors.length,
                                (index) => errorMassage(error: errors[index])),
                          ),
                          SizedBox(
                            height: getPropertScreenHeight(10),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: DefultButton(
                              buttonPress: () {
                                if (!formvaliate.currentState.validate()) {
                                  print('complete form');

                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //         content:
                                  //             Text('Please complete form')));
                                } else {
                                  Navigator.pushNamed(
                                      context, SignInScreen.routName);
                                }
                                return null;
                              },
                              buttonText: 'Continue',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: getPropertScreenHeight(10),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SoicalMediaButton(
                            imageName: 'assets/icons/icons8-google.svg',
                          ),
                          SoicalMediaButton(
                            imageName: 'assets/icons/icons8-facebook-f.svg',
                            iconColor: faceBookColor,
                          ),
                          SoicalMediaButton(
                            imageName: 'assets/icons/icons8-twitter.svg',
                            iconColor: twitterColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: getPropertScreenHeight(10),
                      ),
                      Text(
                        'By continuing your confirm that you agree \nwith our Term and Condition',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: primaryColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding errorMassage({String error}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/close-round-line.svg',
          color: mainColor,
          width: getPropertScreenWidth(20),
          height: getPropertScreenHeight(20),
        ),
        Text(error),
        SizedBox(
          height: getPropertScreenHeight(20),
        )
      ],
    ),
  );
}
