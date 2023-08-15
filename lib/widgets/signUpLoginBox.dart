// ignore_for_file: depend_on_referenced_packages, file_names, camel_case_types, unused_import, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woft_1st_project/Pages/SignInPage.dart';
import 'package:woft_1st_project/Pages/productList.dart';
import 'package:woft_1st_project/widgets/buildpassword.dart';
import 'package:http/http.dart' as http;
import '../utils/shareddata.dart';
import '../utils/url.dart';
import 'buildEmail.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _formkey = GlobalKey<FormState>();

class signUpLoginBox extends StatefulWidget {
  const signUpLoginBox({super.key});

  @override
  State<signUpLoginBox> createState() => _signUpLoginBoxState();
}

class _signUpLoginBoxState extends State<signUpLoginBox> {
  final TextEditingController _passwordController2 = TextEditingController();
  final TextEditingController _emailController2 = TextEditingController();

  @override
  void dispose() {
    _passwordController2.dispose();

    _emailController2.dispose();

    super.dispose();
  }

  Future<void> hundleLogin() async {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(23, 170, 23, 0),
        child: Container(
          height: 600,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 47),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/signUpImg1.png")),
                    Text(
                      "Log in",
                      style: GoogleFonts.italiana(
                        textStyle: const TextStyle(fontSize: 68),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset("assets/images/signUpImg2.png"))
                  ],
                ),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: buildEmail(_emailController2),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              "Password",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600, fontSize: 23),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: buildPassword(_passwordController2),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot your password?",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 43.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            print("in on pressed");
                            if (_formkey.currentState!.validate()) {
                              print("fofrm i s valied...");

                              Map<String, String> loginBody = {
                                "email": _emailController2.text,
                                "password": _passwordController2.text,
                              };

                              final headers = {
                                'Content-Type': 'application/json'
                              };

                              final resp = await http.post(
                                  Uri.parse("${URL.address}/login/"),
                                  headers: headers,
                                  body: json.encode(loginBody));
                              print("sending..");
                              SharedData.saveUser(_emailController2.text);
                              SharedData.saveToken(
                                  jsonDecode(resp.body)['refresh']);

                              try {
                                if (resp.statusCode == 200) {
                                  _formkey.currentState!.reset();
                                  Get.to(const ProductList());
                                } else {
                                  Get.dialog(AboutDialog(
                                    children: [
                                      Text("${json.decode(resp.body)}"),
                                    ],
                                  ));
                                }
                              } catch (e) {
                                Get.dialog(AboutDialog(
                                  children: [
                                    Text("$e"),
                                  ],
                                ));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(4, 99, 4, 100),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(258, 71),
                          ),
                          child: Text(
                            'Sign in',
                            style: GoogleFonts.poppins(
                                fontSize: 28, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? Sign Up",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                      child: const Text(" Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                          )),
                      onTap: () {
                        Get.to(const SigninPage());
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
