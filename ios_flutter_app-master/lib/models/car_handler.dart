import 'package:dio/dio.dart';
import 'package:icar_app/models/car.dart';
import 'package:icar_app/models/carClass_details.dart';
import 'package:icar_app/models/car_details.dart';
import 'package:icar_app/models/car_maintinance.dart';
import 'package:icar_app/models/car_parts.dart';

class CarHandeler {
  static CarHandeler _instance = CarHandeler._private();
  CarHandeler._private();
  static CarHandeler get instance => _instance;
  String mainUrl = 'https://ucars.me/api/ApplicationUcar';
  Dio _dio = Dio();

  Future<List<Car>> getCarCompany() async {
    String url = '$mainUrl/carcompanies';
    Response response = await _dio.get(url);
    List<Car> cars = (response.data['data'] as List).map((car) {
      return Car.fromJson(car);
    }).toList();
    return cars;
  }

  Future<List<CarDetails>> getCarByCarId(int carId) async {
    String url = '$mainUrl/carcompany/$carId';
    Response response = await _dio.get(url);

    List<CarDetails> cars = (response.data['data'] as List).map((car) {
      return CarDetails.fromJson(car);
    }).toList();
    return cars;
  }

  Future<List<CarclassDetails>> getCarClass(String link) async {
    String url = '$link';
    print("link:$url");
    Response response = await _dio.get(url);
    List<CarclassDetails> cars = (response.data['data'] as List).map((car) {
      return CarclassDetails.fromJson(car);
    }).toList();
    return cars;
  }

  Future<List<CarParts>> getCarParts(int carsId) async {
    String url = '$mainUrl/part/$carsId';
    Response response = await _dio.get(url);
    List<CarParts> cars = (response.data['data'] as List).map((car) {
      return CarParts.fromJson(car);
    }).toList();
    return cars;
  }

  Future<List<CarMaintinance>> getCarMaintinance(int carsId) async {
    String url = '$mainUrl/typeparts/$carsId';
    Response response = await _dio.get(url);
    List<CarMaintinance> cars = (response.data['data'] as List).map((car) {
      return CarMaintinance.fromJson(car);
    }).toList();
    return cars;
  }
}
