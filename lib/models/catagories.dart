// ignore_for_file: non_constant_identifier_names

class Catagory {
 
  final String catagory_nname;
  final String image;
  Catagory(this.catagory_nname,this.image);
  factory Catagory.fromJson(Map<String,dynamic> json){
    return Catagory("${json['catagory_name']}",json['image']);
  } 
}