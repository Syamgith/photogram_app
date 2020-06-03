import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoGram',
      theme: ThemeData(
          primarySwatch: Colors.purple, accentColor: Colors.greenAccent),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}