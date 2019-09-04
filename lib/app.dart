import 'package:flutter/material.dart';
import 'package:flutter_transitions/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vroom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Grobold',
      ),
      home: HomeScreen(),
    );
  }
}
