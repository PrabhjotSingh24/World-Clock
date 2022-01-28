// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:world_clock/screens/choose_location.dart';
import 'package:world_clock/screens/home.dart';
import 'package:world_clock/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
