
class About {
 
  final String company;
  final String description;
  final String platforms;
  About(this.company,this.description,this.platforms);
  factory About.fromJson(Map<String,dynamic> json){
    return About("${json['company']}",json['description'],json['platforms']);
  } 
}