import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //Add Locations
  List<WorldTime> locations = [
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'uk.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  ];

  //Show new time ones location is changed
  void updateTime(index) async {
    WorldTime instance = locations[index];//Store index of whatever location we are using
    await instance.getTime();//Wait until we get the time for new location
    // Navigate to home screen and pass the data
    Navigator.pop(context, {//Close navigation page and pass the data
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(//When you use app bar on different page in app, it places a back arrow so you can go back to the previous page
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(//Show locations as a list on the screen
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),//Show location name on the screen
                leading: CircleAvatar(//Show the flag next to name
                  backgroundImage: AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
