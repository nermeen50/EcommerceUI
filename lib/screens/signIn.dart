import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ecommerce/componant/defultAppBar.dart';
import 'package:test_ecommerce/componant/defultButton.dart';
import 'package:test_ecommerce/componant/defultTextField.dart';
import 'package:test_ecommerce/componant/soicalMediaButton.dart';
import 'package:test_ecommerce/helper/keyboard.dart';
import 'package:test_ecommerce/screens/forgetScreen.dart';
import 'package:test_ecommerce/screens/loginSuccess.dart';
import 'package:test_ecommerce/screens/signUpScreen.dart';
import 'package:test_ecommerce/screens/splashScreen.dart';
import 'package:test_ecommerce/sizeConfig.dart';
import 'package:easy_localization/easy_localization.dart';

import '../constants.dart';

class SignInScreen extends StatefulWidget {
  static String routName = '/signIn';
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  final formkey = GlobalKey<FormState>();
  final List<String> errors = [];

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;

        if (rememberMe) {
          // TODO: Here goes your functionality that remembers the user.
        } else {
          // TODO: Forget the user
        }
      });
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: DefultAppBar(
          leadingIcon: Icons.arrow_back,
          press: () {
            KeyboardUtil.hideKeyboard(context);

            Navigator.pop(context, SplashScreen.routeName);
          },
          title: "signIn".tr(),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Text(
                "titleSignIn",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getPropertScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ).tr(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "subTitleSignIn",
                  textAlign: TextAlign.center,
                ).tr(),
              ),
              SizedBox(
                height: getPropertScreenHeight(20),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      DefultTextField(
                        funcOnChange: (val) {
                          if (val.isNotEmpty) {
                            removeError(error: kEmailNullError);
                          } else if (emailRegExp.hasMatch(val)) {
                            removeError(error: kInvalidEmailError);
                          }
                          return null;
                        },
                        valitateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            addError(error: kEmailNullError);
                            return '';
                          } else if (!emailRegExp.hasMatch(value)) {
                            addError(error: kInvalidEmailError);
                            return '';
                          }
                          return null;
                        },
                        hintText: 'emailHint'.tr(),
                        labelText: "email".tr(),
                        inputIcon: Icon(Icons.email),
                        textObscure: false,
                      ),
                      SizedBox(
                        height: getPropertScreenHeight(20),
                      ),
                      DefultTextField(
                        funcOnChange: (val) {
                          if (val != null || val.isNotEmpty) {
                            removeError(error: kPassNullError);
                          } else if (val.length > 6) {
                            removeError(error: kShortPassError);
                          }
                          return null;
                        },
                        valitateFunction: (value) {
                          if (value == null || value.isEmpty) {
                            addError(error: kPassNullError);
                            return '';
                          } else if (value.length < 6) {
                            addError(error: kShortPassError);
                            return '';
                          }
                          return null;
                        },
                        hintText: 'passwordHint'.tr(),
                        labelText: "password".tr(),
                        inputIcon: Icon(Icons.lock),
                        textObscure: true,
                      ),
                      SizedBox(
                        height: getPropertScreenHeight(20),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: _onRememberMeChanged,
                            activeColor: mainColor,
                          ),
                          Text('remremberText').tr(),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ForgetScreen.routeName);
                            },
                            child: Text(
                              'forget',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ).tr(),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(
                          errors.length,
                          (index) => formErrorText(
                            error: errors[index],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getPropertScreenHeight(20),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DefultButton(
                          buttonPress: () {
                            if (!formkey.currentState.validate()) {
                              print('complete form');
                            } else {
                              formkey.currentState.save();
                              KeyboardUtil.hideKeyboard(context);

                              Navigator.pushNamed(
                                  context, LoginSuccess.routeName);
                            }
                            return null;
                          },
                          buttonText: 'submit'.tr(),
                        ),
                      ),
                      SizedBox(
                        height: getPropertScreenHeight(20),
                      ),
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
                        height: getPropertScreenHeight(20),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'copyRight'.tr(),
                          children: <InlineSpan>[
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, SignUpScreen.routeName);
                                },
                              text: 'SignUp'.tr(),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 20,
                                  color: mainColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

Padding formErrorText({String error}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        SvgPicture.asset(
          "assets/icons/close-round-line.svg",
          color: mainColor,
          height: getPropertScreenHeight(20),
          width: getPropertScreenWidth(20),
        ),
        SizedBox(
          width: getPropertScreenWidth(10),
        ),
        Text(error),
      ],
    ),
  );
}
