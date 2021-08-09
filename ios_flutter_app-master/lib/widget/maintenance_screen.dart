import 'package:flutter/material.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: MediaQuery.of(context).size.width * 0.004,
              color: Colors.grey[700]),
        ),
      ),
      child: Table(
        border: TableBorder.symmetric(
            inside: BorderSide(
          width: MediaQuery.of(context).size.width * 0.004,
          color: Colors.grey[700],
        )),
        children: [
          TableRow(children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02,
                  top: MediaQuery.of(context).size.width * 0.01,
                  bottom: MediaQuery.of(context).size.width * 0.01),
              child: Text(
                "548754685",
                style: TextStyle(
                    fontSize: 15, color: Theme.of(context).accentColor),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.01),
                child: Text(
                  "548754685",
                  style: TextStyle(
                      fontSize: 15, color: Theme.of(context).accentColor),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
