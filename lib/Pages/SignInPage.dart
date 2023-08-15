// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:woft_1st_project/widgets/signUpBackgroundImg.dart';
import 'package:woft_1st_project/widgets/signUpRegisterBox.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: 
      Stack(
        children: [
          SignUpBackgroundImage(),
          SignUpRegisterBox(),
        ],
      ),
    );
  }
}