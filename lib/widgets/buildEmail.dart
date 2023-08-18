// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
ool validateEmail(String email) {
  // Regular expression for email validation
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
  
  return emailRegex.hasMatch(email);
}
Widget buildEmail(TextEditingController controller) => SizedBox(
      height: 64,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "Enter E-mail",
          labelStyle: GoogleFonts.inriaSans(
              fontSize: 15, color: const Color.fromRGBO(136, 136, 136, 100)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black),
          ),
          errorBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          focusedErrorBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorStyle: const TextStyle(color: Colors.black),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          if (value.length < 6) {
            return 'Email must be at least 6 characters long';
          }
             if (validateEmail(value)== true){
            return null;
          }
          else{
            return "email is invalied";
          }
        },
      ),
    );
