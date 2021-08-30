import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:test_ecommerce/routes.dart';
import 'package:test_ecommerce/screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/resources/langs',
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: SplashScreen.routeName,
        routes: routes);
  }
}
