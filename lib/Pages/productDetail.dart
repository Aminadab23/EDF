// ignore_for_file: file_names, must_be_immutable, depend_on_referenced_packages, unnecessary_string_interpolations
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/shareddata.dart';
import '../utils/url.dart';
import 'sdnav.dart';

class ProductDetail extends StatefulWidget {
  Product prod;
  ProductDetail({super.key, required this.prod});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String user;

  @override
  void initState() {
    SharedData.getUser().then((value) {
      setState(() {
        user = value ?? "";
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Dra(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(4, 100, 4, 100),
          title: Text(
            "Product Detail",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(fontSize: 18),
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.asset(
                    "assets/images/product-detail-bg-temp.png",
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.network(
                    widget.prod.imageUrl,
                    alignment: Alignment.center,
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Title: ${widget.prod.name}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 18),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${widget.prod.price}birr \n",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic),
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(widget.prod.productDesc),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: () async {
                      var url = '${URL.address}/addCart/';
                      try {
                        // Fetch user ID based on email
                        var userResponse = await http.get(
                          Uri.parse(
                              '${URL.address}/getUserId/$user'), // Replace with actual URL
                          headers: {'Content-Type': 'application/json'},
                        );

                        if (userResponse.statusCode == 200) {
                          var userId = jsonDecode(userResponse.body)['id'];



                          var body = {
                            'user': "${userId}",
                            'product':widget.prod.product_id,
                          };

                          var headers = {
                            'Content-Type': 'application/json',
                          };

                          var response = await http.post(
                            Uri.parse(url),
                            headers: headers,
                            body: jsonEncode(body),
                          );

                          if (response.statusCode == 201) {
                            Get.snackbar("", 'Cart created successfully',
                                backgroundColor: Colors.blueAccent,
                                colorText: Colors.white,
                                icon: Icon(Icons.shopping_cart_checkout));
                          } else {
                            Get.snackbar("error",
                                'Failed to create cart. Error: ${response.body}',
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          }
                        } else {
                          Get.snackbar("error",
                              'Failed to fetch user ID. Error: ${userResponse.body}',
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      } catch (e) {
                        Get.dialog(AlertDialog(
                          content: Text("$e"),
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color.fromRGBO(4, 99, 4, 100),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(350, 51),
                    ),
                    child: Text(
                      "Add to cart",
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    )),
              )
            ],
          ),
        ));
  }
}
