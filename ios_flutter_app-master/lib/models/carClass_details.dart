import 'package:icar_app/models/carClass_features.dart';

class CarclassDetails {
  int id;
  String carclass;
  int price;
  int year;
  String gearType;
  String warranty;
  String motor;
  int engineCapacity;
  int maximumSpeed;
  String transmissionType;
  int hosrePower;
  int speeds;
  String consumptionRate;
  int cylinder;
  int fuel;
  dynamic fuelTankCapacity;
  dynamic wheelsTire;
  dynamic touchScreen;
  dynamic acceleration;
  dynamic powerAssisted;
  dynamic airbagsNumber;
  dynamic seatsNumber;
  dynamic airCondition;
  dynamic driverSeat;
  dynamic passengerSeat;
  dynamic dashboard;
  int hasFeatures;
  String avatar;
  List<CarClassFeatures> features;
  List<dynamic> imagescar;

  CarclassDetails.fromJson(dynamic json)
      : this.id = json["id"],
        this.carclass = json["carclass"],
        this.price = json["price"],
        this.year = json["year"],
        this.gearType = json["Gear_Type"],
        this.warranty = json["warranty"],
        this.motor = json["Motor"],
        this.engineCapacity = json["engine_capacity"],
        this.maximumSpeed = json["maximum_speed"],
        this.transmissionType = json["transmission_Type"],
        this.hosrePower = json["hosre_power"],
        this.speeds = json["speeds"],
        this.consumptionRate = json["consumption_rate"],
        this.cylinder = json["cylinder"],
        this.fuel = json["fuel"],
        this.fuelTankCapacity = json["fuel_tank_capacity"],
        this.wheelsTire = json["wheels_tire"],
        this.touchScreen = json["touch_screen"],
        this.acceleration = json["Acceleration"],
        this.powerAssisted = json["power_assisted"],
        this.airbagsNumber = json["airbags_number"],
        this.seatsNumber = json["seats_number"],
        this.airCondition = json["air_condition"],
        this.driverSeat = json["driver_seat"],
        this.passengerSeat = json["passenger_seat"],
        this.dashboard = json["dashboard"],
        this.hasFeatures = json["has_features"],
        this.avatar = json["avatar"],
        this.features = List<CarClassFeatures>.from(
            json["features"].map((x) => CarClassFeatures.fromJson(x))),
        this.imagescar = json["imagescar"];
}
