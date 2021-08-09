import 'package:flutter/material.dart';
import 'package:icar_app/widget/about_us.dart';
import 'package:icar_app/widget/contact_us.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(
                Icons.cancel_presentation_rounded,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .6,
                child: Image.asset(
                  'lib/images/ucar_logo.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    'About US',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AbouttUs()),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            InkWell(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .01,
                  ),
                  Text(
                    'Contact US',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
