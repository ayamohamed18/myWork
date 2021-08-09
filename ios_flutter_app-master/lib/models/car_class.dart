class CarClass { 
  int id;
    String carClass;
    String link;
    
  CarClass({
        this.id,
        this.carClass,
        this.link,
    });

    factory CarClass.fromJson(Map<String, dynamic> json) => CarClass(
        id: json["id"],
        carClass: json["carclass"],
        link: json["link"],
    );

    

}






