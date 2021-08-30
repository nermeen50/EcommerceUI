import 'package:flutter/material.dart';
import 'package:test_ecommerce/componant/defultCard.dart';
import 'package:test_ecommerce/componant/defultTextField.dart';
import 'package:test_ecommerce/constants.dart';
import 'package:test_ecommerce/sizeConfig.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [
    {
      'icon': Icons.flash_on,
      'text': 'Flash Deal',
    },
    {
      'icon': Icons.build_outlined,
      'text': 'Bill',
    },
    {
      'icon': Icons.games,
      'text': 'Games',
    },
    {
      'icon': Icons.gif_outlined,
      'text': 'Daily Gift',
    },
    {
      'icon': Icons.more,
      'text': 'More',
    },
  ];
  List<Map<String, String>> cardList = [
    {
      'image': 'assets/images/Image Popular Product 1.png',
      'title': 'SmartPhone',
      'subTitle': '18 Brand'
    },
    {
      'image': 'assets/images/Image Popular Product 2.png',
      'title': 'Fashion',
      'subTitle': '28 Brand'
    },
    {
      'image': 'assets/images/Image Popular Product 3.png',
      'title': 'Fashion',
      'subTitle': '28 Brand'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: getPropertScreenWidth(250),
                  child: DefultTextField(
                    textObscure: false,
                    hintText: 'Search product',
                    iconPrefix: Icon(
                      Icons.search,
                    ),
                    colorFill: kSecondaryColor,
                    fillBool: true,
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSecondaryColor,
                      ),
                      child: Icon(Icons.add_shopping_cart)),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kSecondaryColor,
                        ),
                        child: Icon(Icons.notifications_outlined),
                      ),
                      Positioned(
                        right: 4.0,
                        top: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            '3',
                            style: TextStyle(color: whiteColor),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.only(top: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                color: faceBookColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'A Summmer Serprice',
                        style: TextStyle(color: whiteColor, fontSize: 10),
                      ),
                      Text(
                        'Cash Back 20%',
                        style: TextStyle(color: whiteColor, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: getPropertScreenHeight(150),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: primaryColor),
                            child: Icon(
                              list[i]['icon'],
                              color: mainColor,
                            ),
                          ),
                          Text(
                            '${list[i]['text']}',
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special For You',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'See More',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getPropertScreenWidth(20),
                  ),
                  Container(
                    height: 130,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: cardList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DefultCard(
                              imagePath: cardList[i]['image'],
                              textTitle: cardList[i]['title'],
                              subTitle: cardList[i]['subTitle'],
                              height: getPropertScreenHeight(150),
                              width: getPropertScreenWidth(200),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getPropertScreenHeight(20),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Product',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'See More',
                          style: TextStyle(color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getPropertScreenWidth(20),
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: cardList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Card(
                              child: Container(
                                height: getPropertScreenHeight(30),
                                width: getPropertScreenWidth(130),
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage(cardList[i]['image']),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
