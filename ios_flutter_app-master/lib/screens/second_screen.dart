import 'package:flutter/material.dart';
import 'package:icar_app/models/car.dart';
import 'package:icar_app/widget/car_card.dart';
import 'package:icar_app/widget/workshop_card.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = '/second';
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool workshops;
  Color carColor = Colors.grey;
  Color workColor = Colors.black;

  @override
  void initState() {
    super.initState();
    workshops = false;
  }

  @override
  Widget build(BuildContext context) {
    Car car = ModalRoute.of(context).settings.arguments as Car;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            color: carColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton(
                              child: Text(
                                'CARS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  workshops = false;
                                  workColor = Colors.black;
                                  carColor = Colors.grey;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                            color: workColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextButton(
                              child: Text(
                                'WORKSHOPS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    workshops = true;
                                    carColor = Colors.black;
                                    workColor = Colors.grey;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                (workshops) ? WorkshopCard.byID(car.id) : CarCard.byID(car.id)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
