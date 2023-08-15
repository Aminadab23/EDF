// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:woft_1st_project/widgets/signUpBackgroundImg.dart';
import 'package:woft_1st_project/widgets/signUpLoginBox.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final storage = const FlutterSecureStorage();
  Future<String?> getToken() async{
  String? authToken = await storage.read(key: 'authToken');
  if(authToken != null){
return authToken;
}
return null;
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: 
      Stack(
        children: [
          SignUpBackgroundImage(),
          signUpLoginBox(),
        ],
      ),
    );
  }
}