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
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    String s;
    Color? customColor =
        data['isday'] == true ? Colors.grey[850] : Colors.white;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  'lib/assets/${data['location'].split("/")[0].toLowerCase() == 'asia' ? 'india' : data['location'].split("/")[0].toLowerCase()}.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(data['isday'] == true
                        ? 'lib/assets/day1.png'
                        : 'lib/assets/night1.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 525, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                              onPressed: () async {
                                dynamic result = await Navigator.pushNamed(
                                    context, '/location');
                                setState(() {
                                  if (result != null) {
                                    data = {
                                      "location": result['location'],
                                      "time": result['time'],
                                      'isday': result['isday']
                                    };
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.location_on,
                                size: 30,
                                color: customColor,
                              ),
                              label: Text(
                                data["location"].split("/")[1],
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 35,
                                    color: customColor),
                              )),
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
      ),
    );
  }
}
