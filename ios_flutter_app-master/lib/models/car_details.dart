import 'package:icar_app/models/car_class.dart';

class CarDetails {
  int id;
  String title;
  String avatar;
  String minUsedprice;
  String midUsedprice;
  String maxUsedprice;
  int startPrice;
  int lastPrice;
  List<CarClass> cars;

  CarDetails({
    this.id,
    this.title,
    this.avatar,
    this.minUsedprice,
    this.midUsedprice,
    this.maxUsedprice,
    this.startPrice,
    this.lastPrice,
    this.cars,
  });
  factory CarDetails.fromJson(Map<String, dynamic> json) => CarDetails(
        id: json["id"],
        title: json["title"],
        avatar: json["avatar"],
        minUsedprice: json["min_usedprice"],
        midUsedprice: json["mid_usedprice"],
        maxUsedprice: json["max_usedprice"],
        startPrice: json["start_price"] == null ? null : json["start_price"],
        lastPrice: json["last_price"] == null ? null : json["last_price"],
        cars: List<CarClass>.from(
                (json["cars"] as List).map((car) => CarClass.fromJson(car)))
            .toList(),
        
      );
}
