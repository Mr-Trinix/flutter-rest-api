import 'package:flutter/material.dart';

// Pages
import 'package:flutterapp/pages/HomePage.dart';
import 'package:flutterapp/pages/LoginPage.dart';
import 'package:flutterapp/pages/ProductsPage.dart';
import 'package:flutterapp/pages/ContactPage.dart';
import 'package:flutterapp/pages/TeamPage.dart';

import 'package:flutterapp/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trinix\'s Burger',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      routes: {
        RouteManager.homePage: (context) {
          if (ModalRoute.of(context)!.settings.arguments == null) return const LoginPage();
          return const HomePage();
        },
        RouteManager.contactPage: (context) {
          if (ModalRoute.of(context)!.settings.arguments == null) return const LoginPage();
          return const ContactPage();
        },
        RouteManager.productsPage: (context) {
          if (ModalRoute.of(context)!.settings.arguments == null) return const LoginPage();
          return const ProductsPage();
        },
        RouteManager.loginPage: (context) => const LoginPage(),
        RouteManager.teamPage: (context) {
          if (ModalRoute.of(context)!.settings.arguments == null) return const LoginPage();
          return const TeamPage();
        }
      },
      initialRoute: RouteManager.loginPage,
    );
  }
}
