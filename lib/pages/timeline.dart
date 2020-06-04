import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';
import 'package:fluttershare/pages/upload.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/post.dart';

import 'home.dart';

class Timeline extends StatefulWidget {
  Timeline({this.currentUser});
  final User currentUser;
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<Post> posts;
  @override
  void initState() {
    super.initState();
    //getTimeLine();
  }

  Future<List<Post>> getTimeLine() async {
    QuerySnapshot snapshot =
        await postsRef.orderBy('timeStamp', descending: true).getDocuments();
    if (snapshot.documents != null) {
      List<Post> newPosts =
          snapshot.documents.map((doc) => Post.fromDocument(doc)).toList();
      print(newPosts);
      setState(() {
        this.posts = newPosts;
      });
      return posts;
    }
  }
//
//  buildTimeline() {
//    if (posts == null) {
//      return Center(
//          child: Text(
//        'No Posts!',
//        style: TextStyle(fontSize: 22),
//      ));
//    }
//    return ListView(
//      children: posts,
//    );
//  }

  buildTimeline() {
    return FutureBuilder<List<Post>>(
        future: getTimeLine(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post> newposts = snapshot.data;
            return ListView.builder(
                itemCount: newposts.length,
                itemBuilder: (context, index) {
                  return posts[index];
                });
          } else {
            return Text('No photos');
          }
        });
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Upload(widget.currentUser);
                },
              ),
            );
          },
        ),
        body: buildTimeline()
        //RefreshIndicator(
        //onRefresh: () => getTimeLine(),
        //child: buildTimeline(),
        );
  }
}
//RaisedButton(
//child: Text('Logout'),
//onPressed: () {
//googleSignIn.signOut();
//})
