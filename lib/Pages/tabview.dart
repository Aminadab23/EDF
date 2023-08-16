import 'package:flutter/material.dart';

class TheTabs extends StatelessWidget {
 
const TheTabs({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Description"),
                Tab(text: "Company"),
                Tab(text: "Our works"),
              ],
              labelColor: Colors.black,
indicator: BoxDecoration(),
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black12),
              unselectedLabelStyle: TextStyle(color: Colors.black12,fontWeight: FontWeight.normal),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                         
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Ethiopian Digital Farmers",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
"Welcome to EDF (Ethiopian Digital Farmers) agricultural e-commerce platform, where you can find everything you need to grow your farm and boost your yields. We offer a wide range of product categories, all of which are carefully selected and tested to ensure their quality and effectiveness. \n\n We understand that farming can be a challenging and unpredictable business, which is why we strive to provide our customers with the best possible products and service. \n\n With our easy-to-use platform, you can browse and purchase products from the comfort of your home and have them delivered right to your doorstep. Agricultural e-commerce is revolutionizing the way farmers and consumers buy and sell products. With the convenience of online shopping, farmers can access a wider range of customers, and consumers can purchase fresh, high-quality produce directly from the source.\n\n The four main categories of products on agricultural e-commerce platforms are crops, livestock, equipment, and services. By offering a user-friendly interface, detailed product information, and secure payment options, agricultural e-commerce platforms are transforming the agricultural industry. As technology continues to evolve, we can expect to see further growth in the agricultural e-commerce sector, providing new opportunities for farmers and consumers alike. That’s why the Ethiopian digital farmers are giving a first step to agricultural e-commerce to modernize society and making it easier than before. "    )                 ]),
                    ))
                    ],
                  ),
                    ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Company",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium."),
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Lorem epsum",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.")
                        ]),
                      ))
                    ],
                  ),
                    ListView(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 20),
                        child: const Column(children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Our works",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium."),
                          
                          SizedBox(height: 8,),
                          
                          Align(
                            alignment: Alignment.centerLeft,
                            
                            child: Text(
                              "Lorem epsum",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 42),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetur adipisicing elit.\n\n Dolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.Lorem ipsum dolor sit amet, consectetur adipisicing elit. \n\nDolorem enim deserunt voluptates quos officiis eligendi cum dolor quis fugiat ab hic nemo possimus sed, dignissimos ea optio corrupti tempora accusantium.")
                        ]),
                      ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
