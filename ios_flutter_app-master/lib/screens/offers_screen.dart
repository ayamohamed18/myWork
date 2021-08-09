import 'package:flutter/material.dart';
import 'package:icar_app/providers/workshop_provider.dart';
import 'package:icar_app/screens/workshops_screen.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  static const routeName = "/offers";

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
      bool done = await Provider.of<WorkshopProvider>(context, listen: false)
          .fetchWorkshopOffers();
      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: (firstRun)
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).accentColor),
              )
            : (successful)
                ? ListView.builder(
                    itemCount: Provider.of<WorkshopProvider>(context)
                        .workshopoffers
                        .length,
                    itemBuilder: (context, index) {
                      final offers = Provider.of<WorkshopProvider>(context)
                          .workshopoffers[index]
                          .offer;
                      final workshop =
                          Provider.of<WorkshopProvider>(context, listen: false)
                              .workshopoffers[index];
                      return (offers != 0)
                          ? InkWell(
                             
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        .002),
                                height:
                                    MediaQuery.of(context).size.height * 0.17,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey[700],
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width *
                                          .25,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.grey[350],
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
                                                Provider.of<WorkshopProvider>(
                                                        context)
                                                    .workshopoffers[index]
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
                                            margin: EdgeInsets.only(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .01,
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Provider.of<WorkshopProvider>(
                                                        context)
                                                    .workshopoffers[index]
                                                    .title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .1,
                                            margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02,
                                            ),
                                            child: FittedBox(
                                              child: Text(
                                                Provider.of<WorkshopProvider>(
                                                        context)
                                                    .workshopoffers[index]
                                                    .disOffer,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
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

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WorkshopDetail.byID(workshop.id),
                                  ),
                                );
                              },
                            )
                          : Container();
                    })
                : Center(
                    child: Text(
                      'Error has occured please check your internet connection ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
      ),
    );
  }
}
