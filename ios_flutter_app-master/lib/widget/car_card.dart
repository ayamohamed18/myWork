import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icar_app/providers/car_provider.dart';
import 'package:icar_app/screens/first_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class CarCard extends StatefulWidget {
  final int carID;
  CarCard.byID(this.carID);
  @override
  _CarCardState createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  bool firstRun, successful;

  @override
  void initState() {
    super.initState();
    firstRun = true;
    successful = false;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (firstRun) {
      bool done = await Provider.of<CarProvider>(context, listen: false)
          .fetchCarsbyID(widget.carID);
      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('#,###,###');
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height * 0.14,
      child: (firstRun)
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor),
            )
          : (successful)
              ? Scrollbar(
                  thickness: 3.5,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          Provider.of<CarProvider>(context).carsbyId.length,
                      itemBuilder: (context, index) {
                        return ListTileTheme(
                          contentPadding: EdgeInsets.all(0),
                          minVerticalPadding: 0,
                          child: ExpansionTile(
                            trailing: SizedBox.shrink(),
                            title: Container(
                              height: MediaQuery.of(context).size.height * .18,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: HexColor("#030303"),
                                        ),
                                        Center(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .25,
                                            child: Image.network(
                                              Provider.of<CarProvider>(context)
                                                  .carsbyId[index]
                                                  .avatar,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          margin: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .03,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .02,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                          ),
                                          child: FittedBox(
                                            child: Text(
                                              Provider.of<CarProvider>(context)
                                                  .carsbyId[index]
                                                  .title,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: Colors.grey[350],
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Card(
                                            margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .05,
                                            )
                                                .add(EdgeInsets.only(
                                                  right: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .15,
                                                ))
                                                .add(EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .01,
                                                )),
                                            color: Colors.grey[400],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                top: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .03,
                                              ).add(EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    .02,
                                              )),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                            left: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                .04)
                                                        .add(
                                                      EdgeInsets.only(
                                                        top: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .02,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            .01,
                                                      ),
                                                      child: Text(
                                                        'Start From:',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .02,
                                                    ).add(
                                                      EdgeInsets.only(
                                                        right: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .04,
                                                      ),
                                                    ),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .04,
                                                    child: FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              .0,
                                                        ),
                                                        child: Text(
                                                          formatter
                                                              .format(Provider.of<
                                                                          CarProvider>(
                                                                      context)
                                                                  .carsbyId[
                                                                      index]
                                                                  .startPrice)
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            children: [
                              FittedBox(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          Provider.of<CarProvider>(context)
                                              .carsbyId[index]
                                              .cars
                                              .length,
                                      itemBuilder: (context, i) {
                                        final carClass =
                                            Provider.of<CarProvider>(context)
                                                .carsbyId[index]
                                                .cars[i]
                                                .carClass;

                                        final minPrice =
                                            Provider.of<CarProvider>(context)
                                                .carsbyId[index];
                                        final midPrice =
                                            Provider.of<CarProvider>(context)
                                                .carsbyId[index]
                                                .midUsedprice;
                                        final maxPrice =
                                            Provider.of<CarProvider>(context)
                                                .carsbyId[index]
                                                .maxUsedprice;
                                        final carDetails =
                                            Provider.of<CarProvider>(context)
                                                .carsbyId[index];
                                        return InkWell(
                                          child: FittedBox(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.05,
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
                                                        size: 15,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .01,
                                                        ),
                                                        child: Text(
                                                          "$carClass cc",
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor),
                                                          textDirection: ui
                                                              .TextDirection
                                                              .ltr,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                              FirstScreen.routeName,
                                              arguments:
                                               Provider.of<CarProvider>(
                                                          context,
                                                          listen: false)
                                                      .carsbyId[index],
                                                       
                                                      // Provider.of<CarProvider>(
                                                      //     context,
                                                      //     listen: false)
                                                      // .carsbyId[index],
                                            );
                                          },
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error has occured please check your internet connection ',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
    );
  }
}
