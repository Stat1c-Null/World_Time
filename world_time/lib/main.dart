import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';//Import other pages into main file
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    //Create routing for different screens
    initialRoute: '/', //Set up first page that is going to load up to be home
    routes: {
      '/': (context) => Loading(),//Context keeps track of where in the routing tree we are
      '/home': (context) => Home(),
      '/location':(context) => ChooseLocation(),
    },
  ));
}

