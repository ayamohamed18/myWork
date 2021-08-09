import 'package:flutter/material.dart';
import 'package:icar_app/models/car.dart';
import 'package:icar_app/models/carClass_details.dart';
import 'package:icar_app/models/car_details.dart';
import 'package:icar_app/models/car_handler.dart';
import 'package:icar_app/models/car_maintinance.dart';
import 'package:icar_app/models/car_parts.dart';

class CarProvider with ChangeNotifier {
  List<Car> carCompany;
  List<CarDetails> carsbyId;
  List<CarclassDetails> carsClass;
  List<CarParts> carsParts;
  List<CarMaintinance> carMaintinance;

  Future<bool> fetchCarCompany() async {
    try {
      carCompany = await CarHandeler.instance.getCarCompany();
      return true;
    } catch (error) {
      print("error1:$error");

      return false;
    }
  }

  Future<bool> fetchCarsbyID(int carid) async {
    try {
      carsbyId = await CarHandeler.instance.getCarByCarId(carid);
      return true;
    } catch (error) {
      print("error2:$error");
      return false;
    }
  }

  Future<bool> fetchCarsClass(String link) async {
    try {
      carsClass = await CarHandeler.instance.getCarClass(link);
      return true;
    } catch (error) {
      print("error3:$error");

      return false;
    }
  }

  Future<bool> fetchCarsParts(int carid) async {
    try {
      carsParts = await CarHandeler.instance.getCarParts(carid);
      return true;
    } catch (error) {
      print("error4:$error");

      return false;
    }
  }

  Future<bool> fetchCarMaintinance(int carid) async {
    try {
      carMaintinance = await CarHandeler.instance.getCarMaintinance(carid);
      return true;
    } catch (error) {
      print("error5:$error");

      return false;
    }
  }
}
