class CarClassFeatures { 
  final String title;
  final int id;
   CarClassFeatures({
        this.id,
        this.title,
        
    });

        factory CarClassFeatures.fromJson(Map<String, dynamic> json) => CarClassFeatures(
        id: json["id"],
        title: json["title"],
       
    );

}






