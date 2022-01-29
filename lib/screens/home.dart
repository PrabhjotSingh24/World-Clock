// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    Color? customColor =
        data['isday'] == true ? Colors.grey[850] : Colors.white;
    // print(customColor);
    // print(data);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(data['isday'] == true
                      ? 'lib/assets/day.png'
                      : 'lib/assets/night.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 500, 0, 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 30,
                          color: customColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(data["location"],
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 35,
                                fontWeight: FontWeight.w200,
                                color: customColor))
                      ],
                    ),
                    Text(
                      data["time"],
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 65,
                          fontWeight: FontWeight.w500,
                          color: customColor),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
