import 'package:flutter/material.dart';

class PartsCard extends StatelessWidget {
  String pImage, price;
  String pText;
  PartsCard(this.pImage, this.pText, this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[700]))),
      child:  Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: MediaQuery.of(context).size.width * .3,
            margin: EdgeInsets.only(left: 5),
            child: Image.network(
              pImage,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .06,
               left: MediaQuery.of(context).size.height * .055,
            ),
            child: Column(
              children: [
                Text(
                  pText,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "$price EPG",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
