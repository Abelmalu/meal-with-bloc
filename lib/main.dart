import 'package:flutter/material.dart';

import 'features/home/ui/home_screen.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home:Home(),
    );
  }



}