import 'package:flutter/material.dart';
import 'package:icar_app/main.dart';
import 'package:icar_app/models/car_details.dart';
import 'package:icar_app/widget/maintenance_screen.dart';
import 'package:icar_app/widget/parts_screen.dart';

class MainParts extends StatefulWidget {
  @override
  _MainPartsState createState() => _MainPartsState();
}

class _MainPartsState extends State<MainParts> {
  bool parts;
  Color mainColor = Colors.grey[200];
  Color partsColor = Colors.grey[700];

  @override
  void initState() {
    super.initState();
    parts = false;
  }

  @override
  Widget build(BuildContext context) {
    // CarDetails carDetails =
    //     ModalRoute.of(context).settings.arguments as CarDetails;
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.grey[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.09,
                          ),
                          child: Text(
                            'Maintenance',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            parts = false;
                            mainColor = Colors.grey[200];
                            partsColor = Colors.grey[700];
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        color: Colors.black,
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextButton(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.2,
                          ),
                          child: Text(
                            'Parts',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              parts = true;
                              mainColor = Colors.grey[700];
                              partsColor = Colors.grey[200];
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              (parts == true)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.amber,
                    )
                  : MaintenanceScreen()
              // PartsScreen.byID(carDetails.cars[index].id),
            ],
          ),
        ),
      ),
    );
  }
}
