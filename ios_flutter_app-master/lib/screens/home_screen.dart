import 'package:flutter/material.dart';
import 'package:icar_app/providers/car_provider.dart';
import 'package:icar_app/screens/offers_screen.dart';
import 'package:icar_app/screens/second_screen.dart';
import 'package:icar_app/widget/Drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          .fetchCarCompany();

      setState(() {
        firstRun = false;
        successful = done;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          leading: IconButton(
            icon: Image.asset('lib/images/discount_icon.png'),
            onPressed: () {
              Navigator.of(context).pushNamed(OffersScreen.routeName);
            },
          ),
          title: Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.height * 0.06),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Image.asset('lib/images/ucar_logo_w.png')),
        ),
        body: (firstRun)
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : (successful)
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      itemCount:
                          Provider.of<CarProvider>(context).carCompany.length,
                      padding: EdgeInsets.all(15),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing:
                            MediaQuery.of(context).size.height * 0.02,
                        mainAxisSpacing:
                            MediaQuery.of(context).size.width * .02,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * .11,
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  child: Image.network(
                                    Provider.of<CarProvider>(context)
                                        .carCompany[index]
                                        .avatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    Provider.of<CarProvider>(context)
                                        .carCompany[index]
                                        .title,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                SecondScreen.routeName,
                                arguments: Provider.of<CarProvider>(context,
                                        listen: false)
                                    .carCompany[index]);
                          },
                        );
                      },
                    ),
                  )
                : Center(
                    child: Text(
                      'Error has occured please check your internet connection ',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
      ),
    );
  }
}
