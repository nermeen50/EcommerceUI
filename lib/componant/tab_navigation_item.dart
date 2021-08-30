import 'package:flutter/material.dart';
import 'package:test_ecommerce/screens/googleMap.dart';
import 'package:test_ecommerce/screens/homeScreen.dart';
import 'package:test_ecommerce/screens/profileScreen.dart';
import 'package:test_ecommerce/screens/searchScreen.dart';

class TabNavigationItem {
  final Widget page;
  final String title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomeScreen(),
          icon: Icon(Icons.home_sharp),
          title: ".",
        ),
        TabNavigationItem(
          page: SearchScreen(),
          icon: Icon(Icons.shopping_basket),
          title: ".",
        ),
        TabNavigationItem(
          page: GoogleMAp(),
          icon: Icon(Icons.comment),
          title: ".",
        ),
        TabNavigationItem(
          page: ProfileScreen(),
          icon: Icon(Icons.person),
          title: ".",
        ),
      ];
}
