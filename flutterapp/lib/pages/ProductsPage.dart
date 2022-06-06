import 'package:flutter/material.dart';
import 'package:flutterapp/api/apiManager.dart';
import 'package:flutterapp/models/product.dart';
import 'package:flutterapp/pages/ProductPage.dart';
import 'package:flutterapp/routes/routes.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product>? _products;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getProducts();
  }

  getProducts() async {
    _products = await ApiManager.getProducts();
    if (_products != null) {
      setState(() {
        isLoaded = true;
      });
    }
    // print(_products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Découvez nos produits')),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: _products?.length,
          itemBuilder: (context, index) {
            return ProductCard(
                id: _products![index].id.toString(),
                star: _products![index].star,
                title: _products![index].title,
                image:
                    'http://localhost:3001/images/' + _products![index].image);
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String id;
  final String star;
  final String title;
  final String image;

  ProductCard({
    required this.id,
    required this.star,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const SizedBox(width: 7),
                      Text(star),
                    ],
                  ),
                ),
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
          Align(
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProductPage(id),
                    ),
                  )
                },
                child: const Text('Découvrir'),
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
