// ignore_for_file: file_names
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:woft_1st_project/Pages/SignUpPage.dart';
import 'package:woft_1st_project/Pages/productList.dart';
import '../utils/shareddata.dart';
import '../utils/url.dart';
import '../widgets/buildEmail.dart';
import '../widgets/buildUsername.dart';
import '../widgets/buildpassword.dart';
import './sdnav.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
          toolbarHeight: 80,
          title: const Text('Edit profile'),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(4, 99, 4, 100),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/profilepic.png"))),
                    )),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "First Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  padding: const EdgeInsets.only(top: 2, left: 15, right: 15),
                  child: buildUsername(fname),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Last Name",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                  padding: const EdgeInsets.only(top: 2, left: 15, right: 15),
                  child: buildUsername(lname),
                ),
              ),

//Email
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                    padding: const EdgeInsets.only(top: 2, left: 15, right: 15),
                    child: buildEmail(email)),
              ),
              //Password
              Container(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Container(
                    padding: const EdgeInsets.only(top: 2, left: 15, right: 15),
                    child: buildPassword(password)),
              ),
              //Date of birth

              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  var headers = {
                    'Content-Type': 'application/json',
                  };
                  Map<String, dynamic> updatebody = {
                    'email': (email.text != null) ? email.text : user,
                    'first_name': fname.text,
                    'last_name': lname.text,
                    'password': password.text
                  };
                  var response = await http.put(
                      Uri.parse("${URL.address}/updateProfile/$user"),
                      headers: headers,
                      body: json.encode(updatebody));
                  if (response.statusCode == 200) {
                    Get.snackbar("profile update", "succeded!!",
                        backgroundColor: Colors.blueAccent,
                        colorText: Colors.white);
                    Get.to(SignupPage());
                  }
                },
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 5),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(4, 99, 4, 100),
                  ),
                  child: const Center(
                    child: Text(
                      'Save changes',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: "Caveat",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
