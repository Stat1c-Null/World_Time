import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoints
  bool isDaytime; // true or false if day time or not

  //Constructor needs to receive all of this values in order to return time
  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async  {
    try {
      //Make request
      Response response = await get(
          'https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //Create DateTime object and print properly editted time
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught Error: $e');
      time = 'Couldnt not get time data';
    }
  }

}




