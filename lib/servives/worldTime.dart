import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String url;
  String flag;
  bool isDay=true;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0, 3);
      DateTime today = DateTime.parse(datetime);
      
      DateTime now = today.add(Duration(hours: int.parse(offset)));
      isDay=now.hour >6 && now.hour < 19 ?true:false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("error: $e");
      time = "no data exist";
    }
  }
}
