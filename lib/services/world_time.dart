import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; // location name for the UI
  late String time; //the time in this location
  late String flag; // url to the asset flag icon
  late String url; // url for api endpoint
  late bool isDaytime; // to know if we are in the day or night

  // constructor
  WorldTime({required this.location, required this.flag, required this.url});

  Future <void> getTime() async { // i have to add (Future) so i can use (await) in the loading file ( setupWorldTime() )
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    //Response response = await get(Uri.http('worldtimeapi.org', '/api/timezone/Africa/Algiers'));
    Map data = jsonDecode(response.body);
    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1,3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false ;
    // set the time variable
    time = DateFormat.jm().format(now);
  }

}