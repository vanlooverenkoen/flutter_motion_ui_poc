import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_transitions/app.dart';

Future<void> main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}
