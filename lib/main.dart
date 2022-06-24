import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/change_loc.dart';
import 'package:world_time/pages/load.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  //  initialRoute: '/home',
    routes: {
      '/':(context)=> Load(),
      '/home':(context) => Home(),
      '/edit-location':(context) => ChangeLoc(),
    },
  ));
}
