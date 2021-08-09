import 'package:dio/dio.dart';
import 'package:icar_app/models/workshop.dart';
import 'package:icar_app/models/workshop_details.dart';

class WorkshopHandler {
  static WorkshopHandler _instance = WorkshopHandler._private();
  WorkshopHandler._private();
  static WorkshopHandler get instance => _instance;
  String mainUrl = 'https://ucars.me/api/ApplicationUcar';
  Dio _dio = Dio();

  Future<List<Workshop>> getworkshopByCarId(int carId) async {
    String url = '$mainUrl/companyworkshop/$carId';
    Response response = await _dio.get(url);
    List<Workshop> workshops = (response.data['data'] as List).map((workshop) {
      return Workshop.fromJson(workshop);
    }).toList();
    return workshops;
  }

  Future<List<WorkshopDetails>> getWorkshopdetails(int workId) async {
    String url = '$mainUrl/workshop/$workId';
    Response response = await _dio.get(url);
    List<WorkshopDetails> workshops =
        (response.data['data'] as List).map((workshop) {
      return WorkshopDetails.fromJson(workshop);
    }).toList();
    return workshops;
  }

  Future<List<WorkshopDetails>> getWorkshopOffers() async {
    String url = '$mainUrl/allworkshops';
    Response response = await _dio.get(url);

    List<WorkshopDetails> workshops =
        (response.data['data'] as List).map((workshop) {
      return WorkshopDetails.fromJson(workshop);
    }).toList();
    return workshops;
  }
}
