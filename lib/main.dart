
import 'package:flutter/material.dart';
import 'package:world_time/pages/c_loction.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) =>Loading(),
    '/home': (context) => Home(),
    '/location':(context)=> C_Location(),

  },
));

