import 'package:flutter/material.dart';
import 'package:fluttershare/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterShare',
      theme: ThemeData(
          primarySwatch: Colors.purple, accentColor: Colors.cyanAccent),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
