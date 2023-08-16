import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woft_1st_project/Pages/sdnav.dart';
import 'package:http/http.dart' as http;

import '../models/cart.dart';
import '../models/product.dart';
import '../utils/shareddata.dart';
import '../utils/url.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  late String user;

  Future<List<Map<String, dynamic>>> fetchCartItems(String email) async {
    final response =
        await http.get(Uri.parse('${URL.address}/viewCart/$email'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return List<Map<String, dynamic>>.from(parsed['data']);
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  @override
  void initState() {
    SharedData.getUser().then((value) {
      setState(() {
        user = value ?? "fitahbgb@hbgb.com";
      });
    });

    super.initState();
  }
double totalProice = 35.75; // sum of the noOfItems * price of each
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Dra(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        padding: EdgeInsets.symmetric(vertical: 7.0),
        child: Column(
          children: [
            SizedBox(
              height: 490,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchCartItems(user),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: SizedBox(
                            height: 100,
                            width: 100,
                            child: const CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('No cart items found.');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        List<int> noOfItems= [];
                        for (int i=0; i<item.length; i++){
                          noOfItems.add(1);
                        }
                        
                        return (noOfItems[index]>=1)? Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: (ListTile(
                            leading: Image.network(
                                "${URL.address}/media/${item['image']}"),
                            title: Text(item['name']),
                            subtitle: Column(
                              children: [
                                Text('Price: ${item['price']} ETB'),
                             
                              ],
                            ),
                            trailing: Container(
                              width :30,
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    onTap: () {
                                      
                                              if (noOfItems[index]>0){
                                                setState((){
                                        noOfItems[index]-=1;
                                        totalProice-= (noOfItems[index]* double.parse(item['price']));
                                      });}
                            else{
                              Get.dialog(AlertDialog(content: Text("you dont have any item ${item[index].name}")));
                            }
                                             
                                      Get.snackbar("-", "1 item decreased",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white);
                                    },
                                  ),
                                  Container(
                                      margin: const EdgeInsets.all(3),
                                      child: Text("${noOfItems[index]}")),
                                  GestureDetector(
                                    child: const Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    onTap: () {
                                      setState((){
                                        totalProice-= (noOfItems[index]* double.parse(item['price']));
                                        noOfItems[index]+=1;
                                        totalProice+= (noOfItems[index]* double.parse(item['price']));
                                      });
                                      Get.snackbar("+", "1 item increased",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white);
                                    },
                                  )
                                ],
                              ),
                            ),
                          )),
                        ):Text("");
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                   Row(
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$totalProice ETB",
                            style: TextStyle(fontSize: 24),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                      child: Container(
                        width: 220,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: const Center(
                            child: Text(
                          "Buy now",
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        )),
                      ),
                      onTap: () {
                       Get.dialog(AlertDialog(
content: Text("your total price is $totalProice"),
actions:[
  Text("cancel"), GestureDetector(
    onTap:  (){Get.snackbar("success", "Bought items", backgroundColor: Colors.green,colorText: Colors.white);},
    child: Text("agree"))
]
                       ));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
