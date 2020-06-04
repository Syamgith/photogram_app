import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/upload.dart';
import 'package:fluttershare/widgets/header.dart';

import 'home.dart';

class Timeline extends StatefulWidget {
  Timeline({this.currentUser});
  final User currentUser;
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(
        context,
        title: 'Timeline',
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.photo_camera),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Upload(widget.currentUser);
            }));
          }),
      body: RaisedButton(
          child: Text('Logout'),
          onPressed: () {
            googleSignIn.signOut();
          }),
    );
  }
}
