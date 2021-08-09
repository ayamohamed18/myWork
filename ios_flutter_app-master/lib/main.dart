import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:icar_app/providers/car_provider.dart';
import 'package:icar_app/providers/workshop_provider.dart';
import 'package:icar_app/screens/first_screen.dart';
import 'package:icar_app/screens/home_screen.dart';
import 'package:icar_app/screens/offers_screen.dart';
import 'package:icar_app/screens/second_screen.dart';
import 'package:icar_app/screens/workshops_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkshopProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: HexColor("#030303"),
          accentColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          FirstScreen.routeName: (context) => FirstScreen(),
          SecondScreen.routeName: (context) => SecondScreen(),
          OffersScreen.routeName: (context) => OffersScreen(),
        },
      ),
    );
  }
}
