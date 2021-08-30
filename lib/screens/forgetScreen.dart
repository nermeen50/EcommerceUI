import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_ecommerce/componant/defultAppBar.dart';
import 'package:test_ecommerce/componant/defultButton.dart';
import 'package:test_ecommerce/componant/defultTextField.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/helper/keyboard.dart';
import 'package:test_ecommerce/screens/signIn.dart';
import 'package:test_ecommerce/screens/signUpScreen.dart';
import 'package:test_ecommerce/sizeConfig.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgetScreen extends StatefulWidget {
  static String routeName = '/forget';
  const ForgetScreen({Key key}) : super(key: key);

  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final List<String> errors = [];
  final formkey = GlobalKey<FormState>();
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
          title: 'forget'.tr(),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: getPropertScreenHeight(50),
              ),
              Text(
                'forget',
                style: TextStyle(
                  fontSize: getPropertScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ).tr(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "hintForget",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryColor),
                ).tr(),
              ),
              SizedBox(
                height: getPropertScreenHeight(50),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      DefultTextField(
                        hintText: 'emailHint'.tr(),
                        labelText: 'email'.tr(),
                        inputIcon: Icon(Icons.email),
                        textObscure: false,
                        funcOnChange: (val) {
                          if (val != null || val.isEmpty) {
                            removeItem(item: kEmailNullError);
                          } else if (emailRegExp.hasMatch(val)) {
                            removeItem(item: kInvalidEmailError);
                          }
                          return null;
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
                      ),
                      Column(
                          children: List.generate(errors.length,
                              (index) => errorWidget(text: errors[index]))),
                      SizedBox(
                        height: getPropertScreenHeight(100),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DefultButton(
                          buttonPress: () {
                            if (!formkey.currentState.validate()) {
                              print('Complete form data');
                            } else {
                              KeyboardUtil.hideKeyboard(context);
                              Navigator.pushNamed(
                                  context, SignInScreen.routName);
                            }
                            return null;
                          },
                          buttonText: 'continue'.tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getPropertScreenHeight(50),
              ),
              Text.rich(
                TextSpan(
                  text: 'copyRight'.tr(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  children: <InlineSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignUpScreen.routeName);
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
        )),
      ),
    );
  }
}

Padding errorWidget({String text}) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Row(
      children: [
        SvgPicture.asset(
          'assets/icons/close-round-line.svg',
          height: getPropertScreenHeight(20),
          width: getPropertScreenWidth(20),
          color: mainColor,
        ),
        SizedBox(
          width: getPropertScreenWidth(20),
        ),
        Text(text)
      ],
    ),
  );
}
