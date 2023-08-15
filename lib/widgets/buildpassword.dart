import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildPassword(TextEditingController controller) => SizedBox(
      height: 64,
      child: TextFormField(
        obscureText: true,
        controller: controller,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: "Enter Password",
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
            return 'Password is required';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          return null;
        },
      ),
    );
