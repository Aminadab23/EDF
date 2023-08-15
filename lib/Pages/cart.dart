import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woft_1st_project/Pages/sdnav.dart';


class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
   
  List<String> items = [
    'It 1',
    'It 2',
    'It 3',
    'It 1',
    'It 2',
    'It 3',
    'It 1',
    'It 2',
    'It 3',
    'It 1',
    'It 2',
    'It 3',
  ];

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
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0), // Remove default padding
                    leading: Image.asset('assets/images/avocado-image.png',
                        width: 50,
                        height: 50), // Adjust width and height as needed
                    title: Text(items[index]),
                    subtitle: Text(items[index]),
                    trailing: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min, // Ensure row takes minimum space
                        children: [
                          GestureDetector(
                            child: const Text(
                              "-",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            onTap: () {
                              Get.snackbar("-", "1 item decreased",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            },
                          ),
                          Container(
                              margin: const EdgeInsets.all(3), child: Text("$index")),
                          GestureDetector(
                            child: const Text(
                              "+",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            onTap: () {
                              Get.snackbar("+", "1 item increased",
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text("Total", style: TextStyle(fontSize: 24),),
                      SizedBox(width: 100,),
                      Align(
                          alignment: Alignment.centerRight,
                           child: Text("260ETB", style: TextStyle(fontSize: 24),))
                    ],
                  ),
                  const SizedBox(height: 40,),
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
                        Get.snackbar("Success", "Bought items",
                            backgroundColor: Colors.green);
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
