import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icar_app/providers/car_provider.dart';
import 'package:icar_app/widget/details_table.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class DetailsScreen extends StatefulWidget {
  final String link,minPrice,midPrice,maxPrice;
  DetailsScreen.bylink(this.link,this.minPrice,this.midPrice,this.maxPrice);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool firstRun, successful;
  PageController _pageController = PageController();
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
          .fetchCarsClass(widget.link);
          


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
          MediaQuery.of(context).size.height * 0.130,
      child: (firstRun)
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).accentColor,
              ),
            )
          : (successful)
              ? ListView.builder(
                  itemCount: Provider.of<CarProvider>(context).carsClass.length,
                  itemBuilder: (context, index) {
                    final features = Provider.of<CarProvider>(context)
                        .carsClass[index]
                        .hasFeatures;

                    return Container(
                        child: SafeArea(
                            child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * .02,
                          ),
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: Provider.of<CarProvider>(context)
                                .carsClass[index]
                                .imagescar
                                .length,
                            itemBuilder: (context, x) {
                              return Container(
                                child: Image.network(
                                  Provider.of<CarProvider>(context)
                                      .carsClass[index]
                                      .imagescar[x],
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          color: HexColor("#1c1818"),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01),
                                child: FittedBox(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18),
                                        child: FittedBox(
                                          child: Text(
                                            Provider.of<CarProvider>(context)
                                                .carsClass[index]
                                                .carclass,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          formatter
                                                  .format(
                                                      Provider.of<CarProvider>(
                                                              context)
                                                          .carsClass[index]
                                                          .price)
                                                  .toString() +
                                              " EGB",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  textDirection: ui.TextDirection.rtl,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01),
                                      child: FittedBox(
                                        child: Text(
                                          "insurance Amount: " +
                                              formatter
                                                  .format(
                                                      Provider.of<CarProvider>(
                                                                  context)
                                                              .carsClass[index]
                                                              .price *
                                                          0.025)
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 14),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Row(
                                  children: [
                                    Text(
                                      "Used Price",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          color: HexColor("#1c1818"),
                          margin: EdgeInsets.all(10),
                          child: Table(
                            border: TableBorder.symmetric(
                                inside: BorderSide(
                              color: Colors.grey[700],
                            )),
                            children: [
                              TableRow(
                                children: [
                                  Center(
                                    child: FittedBox(
                                      child: Column(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "Min Used Price\n",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[300]),
                                          ),
                                        ),
                                        FittedBox(
                                            child: Text(
                                          // Provider.of<CarProvider>(
                                          //                         context)
                                          //                     .carsbyId[index].minUsedprice,
                                          widget.minPrice,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[300]),
                                        ))
                                      ]),
                                    ),
                                  ),
                                  Center(
                                    child: FittedBox(
                                      child: Column(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            "Mid Used Price\n",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[300]),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                          //  Provider.of<CarProvider>(
                                          //                         context)
                                          //                     .carsbyId[index].midUsedprice,
                                          widget.midPrice,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[300]),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                  Center(
                                    child: FittedBox(
                                      child: Column(children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Text(
                                            "Max Used Price\n",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[300]),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                          
                                                // Provider.of<CarProvider>(
                                                //                   context)
                                                //               .carsbyId[index].maxUsedprice,
                                                widget.maxPrice,
                                               
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[300]),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.height * 0.01,
                                bottom:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              child: Text(
                                "  Specification",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Details_data(
                              "Motor",
                              Provider.of<CarProvider>(context)
                                  .carsClass[index]
                                  .motor,
                            ),
                            Details_data(
                                "Engine Capacity",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .engineCapacity
                                    .toString()),
                            Details_data(
                                "Gear Type",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .gearType),
                            Details_data(
                                "Gear Shifts",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .speeds
                                    .toString()),
                            Details_data(
                                "Horse Power",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .hosrePower
                                    .toString()),
                            Details_data(
                                "Maximum Speed",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .maximumSpeed
                                    .toString()),
                            Container(
                              height: MediaQuery.of(context).size.height * .005,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[700],
                            ),
                            Details_data(
                                "Number of cylinder",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .cylinder
                                    .toString()),
                            Details_data(
                                "Model",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .year
                                    .toString()),
                            Details_data(
                                "Warranty",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .warranty),
                            Details_data(
                                "Consumption Rate",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .consumptionRate),
                            Details_data(
                                "Fuel",
                                Provider.of<CarProvider>(context)
                                    .carsClass[index]
                                    .fuel
                                    .toString()),
                            Container(
                              height: MediaQuery.of(context).size.height * .005,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[700],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(left: 10)
                                    .add(EdgeInsets.only(right: 10)),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[700]))),
                                child: (features != 0)
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            Provider.of<CarProvider>(context)
                                                .carsClass[index]
                                                .features
                                                .length,
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    Provider.of<CarProvider>(
                                                            context)
                                                        .carsClass[index]
                                                        .features[i]
                                                        .title,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey)),
                                                Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                    : null)
                          ],
                        ),
                      ],
                    )));
                  })
              : Center(
                  child: Text(
                    'Error has occured please check your internet connection ',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
    );
  }
}
