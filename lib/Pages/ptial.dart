// ignore_for_file: depend_on_referenced_packages, sized_box_for_whitespace
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/url.dart';
import 'productDetail.dart';

class Prod extends StatefulWidget {
  const Prod({super.key});

  @override
  State<Prod> createState() => _ProdState();
}

class _ProdState extends State<Prod> {
  List<Product> products = [];
  Future<List<Product>> getProducts() async {
    final url = Uri.parse("${URL.address}/products");
    var resp = await http.get(url);

    if (resp.statusCode == 200) {
      // Get.dialog(AlertDialog(
      //     title: const Text(""),
      //     content: Text(resp.body),
      //   ));
      List<dynamic> jsonAnnouncements = json.decode(resp.body);
      products = jsonAnnouncements
          .map((jsonAnnouncement) => Product.fromJson(jsonAnnouncement))
          .toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getProducts(),
      builder: (context, snapshot) {
        return (snapshot.hasData)
            ? GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Container(
                      width: 100,
                      height: 180,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(5),
                      child: Column(children: [
                        Container(
                          height: 90,
                          child: Image.network(products[index].imageUrl),
                        ),
                        Center(
                            child: Text(
                          products[index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )),
                        Center(
                            child: Text(
                          products[index].price,
                          style: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 12),
                        ))
                      ]),
                    ),
                    onTap: () => Get.to(ProductDetail(prod: products[index])),
                  );
                })
            : (snapshot.hasError)
                ? SizedBox(
                    child: Center(child: Text("${snapshot.error}")),
                  )
                : const SizedBox(
                    height: 100,
                    width: 100,
                    child: Center(
                        child: CircularProgressIndicator(
                      semanticsLabel: "getting products",
                      semanticsValue: "loading....",
                    )));
      },
    );
  }
}
