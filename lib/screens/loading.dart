// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:world_clock/logic/weather_data.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String loading = 'Loading';
  void setTime() async {
    final currentTime = WeatherData(urlLocation: "Asia/Kolkata");
    await currentTime.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      "location": currentTime.urlLocation,
      "time": currentTime.time,
      'isday': currentTime.isDay
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent[400],
        body: Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: Colors.white,
                size: 200,
                secondRingColor: Colors.white60,
                thirdRingColor: Colors.white70)));
  }
}
