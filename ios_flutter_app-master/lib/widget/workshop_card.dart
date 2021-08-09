import 'package:flutter/material.dart';
import 'package:icar_app/providers/workshop_provider.dart';
import 'package:icar_app/screens/workshops_screen.dart';
import 'package:provider/provider.dart';

class WorkshopCard extends StatefulWidget {
  final int carID;
  WorkshopCard.byID(this.carID);
  @override
  _WorkshopCardState createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
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
          .fetchWorkshopCompany(widget.carID);
      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height * 0.130,
      child: (firstRun)
          ? Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor),
            )
          : (successful)
              ? ListView.builder(
                  itemCount: Provider.of<WorkshopProvider>(context)
                      .workshopBycarId
                      .length,
                  itemBuilder: (context, index) {
                    final address = Provider.of<WorkshopProvider>(context)
                        .workshopBycarId[index]
                        .address;
                    final workshop =
                        Provider.of<WorkshopProvider>(context, listen: false)
                            .workshopBycarId[index];
                    return InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .002,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .18,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[700],
                          child: Row(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width * .25,
                                child: Stack(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey[350],
                                    ),
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        child: Image.network(
                                          Provider.of<WorkshopProvider>(context)
                                              .workshopBycarId[index]
                                              .avatar,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .02,
                                        left:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      ),
                                      child: Text(
                                        Provider.of<WorkshopProvider>(context)
                                            .workshopBycarId[index]
                                            .title,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        (address != null)
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                  left: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .01,
                                                ),
                                                child: Text(
                                                  'Address:',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              )
                                            : Text(""),
                                        Container(
                                            margin: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .02,
                                            ),
                                            child: Text(
                                              address,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                    );
                  },
                )
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
    );
  }
}
