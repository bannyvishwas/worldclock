import 'package:flutter/material.dart';
//import 'package:sensors/sensors.dart';
import 'package:smartpen/pages/home.dart';
import 'package:smartpen/pages/loading.dart';
import 'package:smartpen/pages/chooselocation.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
