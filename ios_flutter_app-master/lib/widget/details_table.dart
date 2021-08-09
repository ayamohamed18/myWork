import 'package:flutter/material.dart';

class Details_data extends StatelessWidget {
  String spec1;
  String spec2;
  Details_data(this.spec1, this.spec2);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.01)
          .add(EdgeInsets.only(
              right: MediaQuery.of(context).size.height * 0.01)),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[700]))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(spec1, style: TextStyle(fontSize: 15, color: Colors.grey)),
            Text(spec2, style: TextStyle(fontSize: 15, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
