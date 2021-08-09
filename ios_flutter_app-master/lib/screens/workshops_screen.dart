import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icar_app/models/workshop.dart';
import 'package:icar_app/providers/workshop_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkshopDetail extends StatefulWidget {
  static const routeName = '/Workshop';
  final int workId;
  WorkshopDetail.byID(this.workId);
  @override
  _WorkshopDetailState createState() => _WorkshopDetailState();
}

class _WorkshopDetailState extends State<WorkshopDetail> {
  Workshop workshop;
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
      workshop = ModalRoute.of(context).settings.arguments as Workshop;
      bool done = await Provider.of<WorkshopProvider>(context, listen: false)
          .fetchWorkshopdetails(widget.workId);

      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.grey[850],
          body: (firstRun)
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).accentColor,
                  ),
                )
              : (successful)
                  ? ListView.builder(
                      itemCount: Provider.of<WorkshopProvider>(context)
                          .workshopByworkId
                          .length,
                      itemBuilder: (context, index) {
                        final disOffer=  Provider.of<WorkshopProvider>(
                                                          context)
                                                      .workshopByworkId[index]
                                                      .disOffer;
                        final location = Provider.of<WorkshopProvider>(context)
                            .workshopByworkId[index]
                            .location;
                        final call = Provider.of<WorkshopProvider>(context)
                            .workshopByworkId[index]
                            .phone;
                        final offers = Provider.of<WorkshopProvider>(context)
                            .workshopByworkId[index]
                            .offer;
                            final description= Provider.of<WorkshopProvider>(context)
                                      .workshopByworkId[index]
                                      .description;
                        final phones = call.split('-');

                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).size.height * .02,
                                ),
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount:
                                      Provider.of<WorkshopProvider>(context)
                                          .workshopByworkId[index]
                                          .images
                                          .length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Image.network(
                                        Provider.of<WorkshopProvider>(context)
                                            .workshopByworkId[index]
                                            .images[index],
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .09,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                  child: FittedBox(
                                    child: Text(
                                      Provider.of<WorkshopProvider>(context)
                                          .workshopByworkId[index]
                                          .title,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).accentColor),
                                    ),
                                  ),
                                ),
                              ),
                             (description!=null)? Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .01,
                                ),
                                child: Text(
                                 description,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ):Text(""),
                              (offers != 0)
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .02,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "The offer",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .03,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                               (disOffer!=null)? Text(
                                                disOffer,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ):Text("")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height * .02,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                .04,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                .02,
                                      ),
                                      child: InkWell(
                                          child: Icon(
                                            Icons.call,
                                            color: Colors.green,
                                            size: 28,
                                          ),
                                          onTap: () {
                                            dynamic getphonelist(index) {
                                              for (var i = 0;
                                                  i < phones.length;
                                                  i++) {
                                                return '${phones[i]}';
                                              }
                                            }

                                            showAlertDialog(
                                                context,
                                                getphonelist(index),
                                                getphonelist(index));
                                          }),
                                    ),
                                    InkWell(
                                      child: Icon(
                                        FontAwesomeIcons.mapMarkerAlt,
                                        color: Colors.blue,
                                        size: 24,
                                      ),
                                      onTap: () async {
                                        final String googleMapUrl = "$location";
                                        final String appleMapsUrl = "$location";

                                        if (await canLaunch(googleMapUrl)) {
                                          await launch(googleMapUrl);
                                        }
                                        if (await canLaunch(appleMapsUrl)) {
                                          await launch(appleMapsUrl);
                                        } else {
                                          throw " could not launch URL";
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context, String text, String tel) {
    AlertDialog alert = AlertDialog(
        backgroundColor: Colors.grey[800],
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final url = "tel://$tel";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print(' could not launch $url');
                  }
                },
              ),
            ],
          ),
        ));

    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alert;
        });
  }
}
