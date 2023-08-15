// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../utils/url.dart';
import 'catagories.dart';

class ProductTypes extends StatefulWidget {
  const ProductTypes({super.key});

  @override
  State<ProductTypes> createState() => _ProductTypesState();
}

class _ProductTypesState extends State<ProductTypes> {
  List<Catagory> catagories = [];
  Future<List<Catagory>> getCatagories() async {
    final resp = await http.get(Uri.parse("${URL.address}/catagories"));
    if (resp.statusCode == 200) {
      List<dynamic> jsonCatagories = json.decode(resp.body);
      catagories = jsonCatagories
          .map((jsonCatagories) => Catagory.fromJson(jsonCatagories))
          .toList();
      return catagories;
    } else {
      throw Exception("Unable to load catagories.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // width: 100,
      child: FutureBuilder(
          future: getCatagories(),
          builder: (context, snapshot) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Image.network(catagories[index].image)),
                    Positioned(
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          catagories[index].catagory_nname,
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 11,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }),
    );
  }
}
