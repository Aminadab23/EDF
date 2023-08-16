// ignore_for_file: non_constant_identifier_names

class Cart {
  final int product_id;
  
  
  Cart(this.product_id);
  factory Cart.fromJson(Map<String,dynamic> json){
    return Cart(json['id']);
  } 
}