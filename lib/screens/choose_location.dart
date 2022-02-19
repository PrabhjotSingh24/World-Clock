// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:world_clock/logic/weather_data.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooselocationListtate createState() => _ChooselocationListtate();
}

class _ChooselocationListtate extends State<ChooseLocation> {
  List<WeatherData> locationList = [
    WeatherData(urlLocation: "Asia/Kolkata", flag: "india"),
    WeatherData(urlLocation: "Europe/Rome", flag: "europe"),
    WeatherData(urlLocation: "Europe/Berlin", flag: "germany"),
  ];
  Future<void> updateTime(index) async {
    WeatherData instance = locationList[index];
    await instance.getData();
    Navigator.pop(context, {
      "location": locationList[index].urlLocation,
      "time": locationList[index].time,
      // 'country': locationList[index].country,
      'isday': locationList[index].isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locationList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locationList[index].urlLocation.split("/")[1]),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'lib/assets/flags/${locationList[index].flag}.png'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
