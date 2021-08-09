import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icar_app/models/car_class.dart';
import 'package:icar_app/models/car_details.dart';
import 'package:icar_app/widget/details_screens.dart';
import 'package:icar_app/widget/parts_screen.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = '/carScreen';


  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool details = true;
  bool parts = false;

  @override
  Widget build(BuildContext context) {
    /* CarClass carClass =
        ModalRoute.of(context).settings.arguments as CarClass;*/
    CarDetails carDetails=ModalRoute.of(context).settings.arguments as CarDetails;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#1c1818"),
        body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      details = true;
                                      parts = false;
                                    });
                                  },
                                  child: Text(
                                    'DETAILS',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                                color: details == true
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      details = false;
                                      parts = true;
                                    });
                                  },
                                  child: Text(
                                    'PARTS',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                                ),
                                color: details == false
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                (details)
                    ? DetailsScreen.bylink(carDetails.cars[index].link,carDetails.minUsedprice,carDetails.midUsedprice,carDetails.maxUsedprice,)
                    : PartsScreen.byID(carDetails.id),
              ],
            ),
          );
        }),
      ),
    );
  }
}
