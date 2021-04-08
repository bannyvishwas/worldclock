import 'package:flutter/material.dart';
import 'package:smartpen/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Delhi', flag: 'day.jpg,', url: 'Asia/Kolkata'),
    WorldTime(location: 'New York', flag: 'day.jpg,', url: 'America/New_York'),
    WorldTime(location: 'Berlin', flag: 'day.jpg,', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'day.jpg,', url: 'Europe/London'),
  ];
  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    //Navigate to Home
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Choose A Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                /*leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),*/
              ),
            ),
          );
        },
      ),
    );
  }
}
