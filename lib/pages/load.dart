import 'package:flutter/material.dart';
import 'package:world_time/servives/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Load extends StatefulWidget {
  // const Load({ Key? key }) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  String time = "loading ...";

  void getTimeWorld() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/London");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDay":instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    getTimeWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      body: Center(
          child: SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
