import 'package:flutter/material.dart';
import 'package:flutterapp/api/apiManager.dart';
import 'package:flutterapp/models/product.dart';
import 'package:flutterapp/routes/routes.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  String? id;
  ProductPage(this.id, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ProductPage> createState() => _ProductPageState(id);
}

class _ProductPageState extends State<ProductPage> {
  List<Product>? _product;
  var isLoaded = true;

  String? id;
  _ProductPageState(this.id);

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  getProduct() async {
    _product = await ApiManager.getProduct(id);
    if (_product != null) {
      setState(() {
        isLoaded = true;
      });
    }
    // print(_product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Description du produit')),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: _product?.length,
          itemBuilder: (context, index) {
            return ProductContent(
              id: _product![index].id.toString(),
              star: _product![index].star,
              title: _product![index].title,
              shortDesc: _product![index].shortDesc,
              body: _product![index].body,
              image: 'http://localhost:3001/images/' + _product![index].image,
            );
          },
        ),
        replacement: const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class ProductContent extends StatelessWidget {
  final String id;
  final String star;
  final String title;
  final String shortDesc;
  final String body;
  final String image;

  ProductContent({
    required this.id,
    required this.star,
    required this.title,
    required this.body,
    required this.shortDesc,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
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
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          shortDesc,
          style: const TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(body),
        ),
      ],
    );
  }
}
