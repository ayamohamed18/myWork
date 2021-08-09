import 'package:flutter/material.dart';
import 'package:icar_app/providers/car_provider.dart';
import 'package:icar_app/widget/parts_card.dart';
import 'package:provider/provider.dart';

class PartsScreen extends StatefulWidget {
  final int carID;
  PartsScreen.byID(this.carID);
  @override
  _PartsScreenState createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
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
      bool done = await Provider.of<CarProvider>(context, listen: false)
          .fetchCarsParts(widget.carID);
      print(done);

      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).size.height * .07,
        child: (firstRun)
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).accentColor),
              )
            : (successful)
                ? Column(
                    children: [
                      SizedBox(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height * .13),
                        child: ListView.builder(
                          itemCount: Provider.of<CarProvider>(context)
                              .carsParts
                              .length,
                          itemBuilder: (context, index) {
                            return PartsCard(
                              Provider.of<CarProvider>(context)
                                  .carsParts[index]
                                  .avatar,
                              Provider.of<CarProvider>(context)
                                  .carsParts[index]
                                  .title,
                              Provider.of<CarProvider>(context)
                                  .carsParts[index]
                                  .price,
                            );
                          },
                        ),
                      ),
                    ],
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
    );
  }
}
