// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WeatherData {
  WeatherData({this.location, this.urlLocation});
  final location;
  var time;
  var urlLocation;
  Future<void> getData() async {
    final url = Uri.parse("http://worldtimeapi.org/api/timezone/$urlLocation");
    Response response = await get(url);
    var data = jsonDecode(response.body);
    var date = DateTime.parse(data["utc_datetime"]);
    var offset = data["utc_offset"];

    if (offset.substring(0, 1) == "+") {
      date = date.add(Duration(hours: int.parse(offset.substring(1, 3))));
      date = date.add(Duration(minutes: int.parse(offset.substring(4, 6))));
    } else if (offset.substring(0, 1) == "-") {
      date = date.subtract(Duration(hours: int.parse(offset.substring(1, 3))));
      date =
          date.subtract(Duration(minutes: int.parse(offset.substring(4, 6))));
    }
    time = DateFormat().add_jm().format(date);
  }
}
