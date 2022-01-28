// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Howyall doin?"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Text(
            "Choose Location",
            textScaleFactor: 2,
          ),
        ));
  }
}
