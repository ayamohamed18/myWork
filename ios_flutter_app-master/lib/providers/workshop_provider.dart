import 'package:flutter/material.dart';
import 'package:icar_app/models/workshop.dart';
import 'package:icar_app/models/workshop_details.dart';
import 'package:icar_app/models/workshop_handler.dart';

class WorkshopProvider with ChangeNotifier {
  List<Workshop> workshopBycarId;
  List<WorkshopDetails> workshopByworkId;
  List<WorkshopDetails> workshopoffers;

  Future<bool> fetchWorkshopCompany(int id) async {
    try {
      workshopBycarId = await WorkshopHandler.instance.getworkshopByCarId(id);
      return true;
    } catch (error) {
      print("error5:$error");

      return false;
    }
  }

  Future<bool> fetchWorkshopdetails(int id) async {
    try {
      workshopByworkId = await WorkshopHandler.instance.getWorkshopdetails(id);

      return true;
    } catch (error) {
      print("error6:$error");

      return false;
    }
  }

  Future<bool> fetchWorkshopOffers() async {
    try {
      workshopoffers = await WorkshopHandler.instance.getWorkshopOffers();

      return true;
    } catch (error) {
      print("error7:$error");

      return false;
    }
  }
}
