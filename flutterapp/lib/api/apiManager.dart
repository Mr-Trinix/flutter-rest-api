import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/product.dart';
import 'package:flutterapp/routes/routes.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<List<Product>?> getProducts() async {
    try {
      var client = http.Client();
      var baseUrl = "http://localhost:3001";

      var uri = Uri.parse(baseUrl + '/products');

      var res = await client.get(uri);
      if (res.statusCode == 200) {
        var json = res.body;
        return productFromJson(json);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List<Product>?> getProduct(id) async {
    try {
      var client = http.Client();
      var baseUrl = "http://localhost:3001";

      var uri = Uri.parse(baseUrl + '/products/' + id);

      var res = await client.get(uri);
      if (res.statusCode == 200) {
        var json = res.body;
        return productFromJson(json);
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<List<Product>?> login(
      BuildContext context, email, password) async {
    try {
      var client = http.Client();
      var baseUrl = "http://localhost:3001";
      var uri = Uri.parse(baseUrl + '/login');
      var data = {"email": email, "password": password};

      var res = await client.post(uri, body: jsonEncode(data), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
      if (res.statusCode == 200) {
        var user = jsonDecode(res.body);
        if (user["isCorrect"]) {
          const snackBar = SnackBar(
            content: Text(
              "Connexion réussie avec succès!",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushNamed(context, RouteManager.homePage,
              arguments: user["uuid"]);
        } else {
          const snackBar = SnackBar(
            content: Text(
              "Mot de passe ou identifiant incorrect",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        return Future.error("erreur serveur");
      }
    } catch (err) {
      return Future.error(err);
    }
    return null;
  }
}
