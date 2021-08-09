import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[850],
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .17,
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('lib/images/ucar_logo.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.135,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .01),
              child: InkWell(
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_phone,
                        color: Theme.of(context).accentColor,
                      ),
                                          SizedBox(width:MediaQuery.of(context).size.height * .005 ,),

                      Text(
                        "0102578963 - 01998538938",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () {
                    showAlertDialog(context);
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .01),
              child: InkWell(
                  child: Row(
                    children: [
                      Icon(
                        Icons.quick_contacts_mail,
                        color: Theme.of(context).accentColor,
                      ),
                                          SizedBox(width:MediaQuery.of(context).size.height * .005 ,),

                      Text(
                        "UcarEgypt@Gmail.com",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () async {
                    final url = 'mailto: ucaregypt@gmail.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      print(' could not launch $url');
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .01),
              child: InkWell(
                child: Row(
                  children: [
                    Image.asset(
                      'lib/images/facebook_icon.png',
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(width:MediaQuery.of(context).size.height * .005 ,),
                    Text(
                      "Ucar",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 18),
                    ),
                  ],
                ),
                onTap: () async {
                  final url = 'https://www.facebook.com/UCAR-104564728578301/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print(' could not launch $url');
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .01),
              child: InkWell(
                  child: Row(
                    children: [
                      Image.asset(
                        'lib/images/instagram_icon.png',
                        color: Theme.of(context).accentColor,
                      ),
                                          SizedBox(width:MediaQuery.of(context).size.height * .005 ,),

                      Text(
                        "Ucar.eg",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 18),
                      ),
                    ],
                  ),
                  onTap: () async {
                    final url = 'https://instagram.com/ucar.eg';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      print(' could not launch $url');
                    }
                  }),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .03,
                  left: MediaQuery.of(context).size.height * .01),
              child: InkWell(
                child: Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: Theme.of(context).accentColor,
                    ),
                                        SizedBox(width:MediaQuery.of(context).size.height * .005 ,),

                    Text(
                      "Tell Friends About Us",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 18),
                    ),
                  ],
                ),
                onTap: () {
                  Share.share('https://www.facebook.com/UCAR-104564728578301/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.grey[800],
      content: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              TextButton(
                child: Text(
                  '+20102578963',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final url = "tel://+20102578963";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print(' could not launch $url');
                  }
                },
              ),
              TextButton(
                child: Text(
                  '+201998538938',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  final url = "tel://+201998538938";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    print(' could not launch $url');
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext buildercontext) {
          return alert;
        });
  }
}
