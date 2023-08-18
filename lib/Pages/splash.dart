import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SignUpPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3), () {
   
        Get.to(const SignupPage());
      
    });
    return Scaffold(
     
      body: Stack(
        
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 100.0),
              child: const Text("Ethiopian Digital Farmers", style: TextStyle(color: Color.fromARGB(96, 46, 243, 56), fontSize: 30, fontWeight: FontWeight.bold),)),),
          Center(
            child: AnimatedAlign(
              alignment: Alignment.center,
              duration: const Duration(seconds: 3),
              curve: Curves.easeInOut,
              child:    Image.asset("assets/images/logo.png")
            ),
          ),
         
          
        ],
      ),
    );
  }}