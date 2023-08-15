// ignore_for_file: non_constant_identifier_names

class Product {
  final String product_id;
  final String name;
  final String price;
  final String imageUrl;
  final String productDesc;
  final String quantity;
  final String catagory;
  Product(this.product_id,this.name, this.price, this.imageUrl,this.productDesc,this.quantity,this.catagory);
  factory Product.fromJson(Map<String,dynamic> json){
    return Product("${json['id']}",json['product_name'],json["product_price"], json['product_image_url'],json['product_description'],json["quantity"], "${json['catagory']}");
  } 
}