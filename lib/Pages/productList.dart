// ignore_for_file: file_names, depend_on_referenced_packages, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woft_1st_project/Pages/ptial.dart';
import 'package:woft_1st_project/Pages/sdnav.dart';
import '../models/productTypes_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Dra(),
        appBar: AppBar(
          title: const Text("Welcome page"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromRGBO(4, 99, 4, 1),
                    Color.fromRGBO(76, 161, 70, 1)
                  ]),
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.asset("assets/images/bg for product detail.png"),
                ),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(children: [
                      Text(
                        "Welcome to Ethiopian Digital Farmers",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      Text(
                        "Join us on our mission to shape the future of agriculture. See more for today and unlock a world of possibilities for your farming endeavors. Together, let’s cultivate a brighter future for agriculture!",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Learn more"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: const Color.fromRGBO(4, 99, 4, 100),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(151, 35),
                        ),
                      ),
                    ]),
                  ),
                )
              ],
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: FractionallySizedBox(
                      widthFactor: 1.0,
                      child: Text(
                        "Product Catagories",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          color: Colors.black,
                        ),
                      )),
                ),
                const ProductTypes(),
              ],
            ),

       
            const Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 34, vertical: 22),
          child: Prod(),
             ),
            )
          ],
        ));
  }
}
