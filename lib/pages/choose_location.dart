import 'package:WorldTime/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Vientiane', flag: 'laos.png', location: 'Vientiane'),
    WorldTime(url: 'Asia/Kolkata', flag: 'india.png', location: 'Kolkata'),
    WorldTime(url: 'Europe/London', flag: 'uk.png', location: 'London'),
    WorldTime(url: 'Europe/Berlin', flag: 'greece.png', location: 'Athens'),
    WorldTime(url: 'Africa/Cairo', flag: 'egypt.png', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', flag: 'kenya.png', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', flag: 'usa.png', location: 'Chicago'),
    WorldTime(url: 'America/New_York', flag: 'usa.png', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', flag: 'south_korea.png', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', flag: 'uk.png', location: 'Jakarta'),
    WorldTime(url: 'Asia/Bangkok', flag: 'thai.png', location: 'Bangkok'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Choose Location"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
