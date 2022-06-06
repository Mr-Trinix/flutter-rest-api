import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapp/routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _uuid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _uuid = _uuid;
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      Object? arg = ModalRoute.of(context)!.settings.arguments;
      setState(() {
        _uuid = arg.toString();
      });
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Trinix\'s Burger')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                "Trinix's Burger est un site de fast-food comme son nom l'indique. Elle propose une large gamme de burgers sur leur site, n'hésitez pas à les découvrir.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed(RouteManager.productsPage, arguments: _uuid)
              },
              child: const Text('Nos produits'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed(RouteManager.teamPage, arguments: _uuid)
              },
              child: const Text('Notre équipe'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed(RouteManager.contactPage, arguments: _uuid)
              },
              child: const Text('Nous contacter'),
            ),
          ],
        ),
      ),
    );
  }
}
