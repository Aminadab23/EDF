// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:woft_1st_project/Pages/sdnav.dart';
import '../utils/url.dart';
import 'tabview.dart';
import 'package:http/http.dart' as http;

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<String> about = [];
  Future<void> getAbout() async {
    final url = Uri.parse("${URL.address}/getAbout/");
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      List<dynamic> jsonAnnouncements = json.decode(resp.body);
      about = jsonAnnouncements.map((dynamic item) => item.toString()).toList();
    }
  }

  @override
  void initState() {
    getAbout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Dra(),
      appBar: AppBar(
        title: const Text("about"),
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
      body: Container(
        margin: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            Stack(children: [
              Image.asset("assets/images/aboutimage.png"),
              Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 60),
                      //   child: Image.network(
                      //       'https://raw.githubusercontent.com/Aminadab23/task1assets/master/Vector.png'),
                      // ),
                      // child: const Icon(Icons.arrow_back_ios_new_outlined,size: 30,weight: 30, color: Colors.white70,),
                      child: const Text(""),
                    ),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 170),
                  child: Image.asset('assets/images/vegansticky.png'),
                ),
              )
            ]),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Column(children: [
                    Text(
                      "About us",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "lorem ipsom dolor",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black26),
                    )
                  ]),
                )),
            TheTabs(
              abouts: about,
            )
          ],
        ),
      ),
    );
  }
}
