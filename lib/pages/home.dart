// ignore_for_file: deprecated_member_use

import 'package:WorldTime/services/save_preferrence.dart';
import 'package:WorldTime/services/world_time.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // Set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[800] : Colors.black;

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      if (result == null) {
                        Navigator.pushNamed(context, '/');
                      } else {
                        data = {
                          'time': result['time'] ?? '',
                          'location': result['location'] ?? '',
                          'isDaytime': result['isDaytime'] ?? '',
                          'flag': result['flag'] ?? '',
                        };
                      }
                    });
                    Util.prefs?.setString('time', result['time']);
                    Util.prefs?.setString('location', result['location']);
                    Util.prefs?.setString('isDaytime', result['isDaytime']);
                    Util.prefs?.setString('flag', result['flag']);
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text("Edit Location",
                      style: TextStyle(color: Colors.grey[300])),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 3.0,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 70.0, color: Colors.white),
                )
              ],
            ),
          ),
        )));
  }
}
