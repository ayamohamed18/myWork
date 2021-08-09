import 'package:flutter/material.dart';
import 'package:icar_app/widget/contact_us.dart';
import 'package:share/share.dart';

class AbouttUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AbouttUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[850],
        child: Expanded(
          child: ListView(children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .06,
                  ),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('lib/images/ucar_logo.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "يوكار تطبيق يساعدك علي معرفة أحدث الموديلات والاسعار والمواصفات لأكثر من 40 ماركة للسيارات العالمية.من خلال يوكار يمكنك معرفة اسعار قطع الغيار الخاصة بسيارتك, ويتيح لك معرفة اسعار السيارات المتداولة لجميع ماركات السيارات العالمية الجديدة والمستعملة, كما يتيح لك معرفة مجموعة من أفضل الورش المتخصصة لكل انواع السيارات. يعرف مصلحة عربيتك - يوكار",
                        maxLines: 50,
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "About Us Ucar is an App provides you with the modernest models, prices and features for more than 40 international car brands,through UCAR you can figure prices of all spare parts for your car. Also provides you with the current prices of all(new and used)car brands, UCAR offers a collection of the best specialized workshops for every car. UCAR - Knows what YOUR Car Wants",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 17),
                        maxLines: 50,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.060,
                  width: MediaQuery.of(context).size.width,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Share.share(
                            'https://www.facebook.com/UCAR-104564728578301/');
                      },
                      icon: Icon(Icons.share),
                      color: Theme.of(context).accentColor,
                    ),
                    FittedBox(
                      child: Card(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * .04,
                        )
                            .add(EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * .07,
                            ))
                            .add(EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.width * .03,
                            )),
                        color: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactUs()),
                            );
                          },
                          child: Text(" Contact Us! ",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.070,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
