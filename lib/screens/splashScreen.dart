import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce/componant/defultButton.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/screens/signIn.dart';
import 'package:test_ecommerce/sizeConfig.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;
  List<Map<String, String>> images = [
    {
      'image': 'assets/images/splash_1.png',
      "text": "textSplash1",
    },
    {
      'image': 'assets/images/splash_2.png',
      "text": "textSplash2",
    },
    {
      'image': 'assets/images/splash_3.png',
      "text": "textSplash3",
    },
  ];
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (Timer timer) {
        if (currentIndex < images.length) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }

        _pageController.animateToPage(
          currentIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  String dropdownvalue = 'English';
  var items = [
    'English',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            DropdownButton(
              value: context.locale == Locale('en') ? dropdownvalue : 'Arabic',
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue = newValue;

                  if (dropdownvalue == 'English') {
                    EasyLocalization.of(context).setLocale(Locale('en'));
                  } else {
                    EasyLocalization.of(context).setLocale(Locale('ar'));
                  }
                });
              },
            ),
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  onPageChanged: _onPageChanged,
                  itemCount: images.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Text(
                          'welcome_text',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                              fontSize: 30,
                              height: 3),
                        ).tr(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              images[i]['text'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ).tr(),
                          ),
                        ),
                        // Spacer(flex: 2),
                        Image.asset(
                          "${images[i]['image']}",
                          height: getPropertScreenHeight(180),
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                      ],
                    );
                  }),
              flex: 3,
            ),
            Expanded(
              child: Column(
                children: [
                  Spacer(flex: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        images.length, (index) => buildDot(index: index)),
                  ),
                  Spacer(flex: 3),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: DefultButton(
                        buttonText: 'Continue',
                        buttonPress: () {
                          Navigator.pushNamed(context, SignInScreen.routName);
                        },
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? mainColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
