// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import './sdnav.dart';
class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => _EditprofileState();
}
class _EditprofileState extends State<Editprofile> {
  
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
                  padding:  const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1,color:Colors.black),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image:AssetImage("assets/images/profilepic.png")
                        )
                    ),
                  )
              ),
            ),
            Container(
              padding:  const EdgeInsets.only(top: 20,left: 15),
              child:  const Align(
                alignment: Alignment.topLeft,
                child:  Text(
                  "Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
           SizedBox(
             height: 40,
             child:  Container(
               padding:  const EdgeInsets.only(top: 2,left: 15,right: 15),
               child: const TextField(
                 decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 1, color: Colors.black),
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderSide: BorderSide(width: 1, color: Colors.black),
                   ),
                 ),
               ),
             ),
           ),
//Email
            Container(
              padding:  const EdgeInsets.only(top: 20,left: 15),
              child:  const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
           SizedBox(
             height: 40,
             child:  Container(
               padding:  const EdgeInsets.only(top: 2,left: 15,right: 15),
               child: const TextField(
                 decoration: InputDecoration(
                     enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 1, color: Colors.black),
                     ),
                     focusedBorder: OutlineInputBorder(
                       borderSide: BorderSide(width: 1, color: Colors.black),
                     )
                 ),
               ),
             ),
           ),
            //Password
            Container(
              padding:  const EdgeInsets.only(top: 20,left: 15),
              child:  const Align(
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
                padding:  const EdgeInsets.only(top: 2,left: 15,right: 15),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      )
                  ),
                ),
              ),
            ),
            //Date of birth
          Container(
               padding:  const EdgeInsets.only(top: 20,left: 15),
                  child:  Align(
                alignment: Alignment.topLeft,
                    child:  DOBInputField(
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      showLabel: true,
                      showCursor: true,
                      autovalidateMode: AutovalidateMode.always,
                      fieldLabelText: "With label",
                    ),
                ),
                ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  // border: Border.all(width: 5),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(4, 99, 4, 100),
                ),
                child: const Center(child: Text('Save changes'
                  ,  style:TextStyle(
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
      )
    );
  }
}
