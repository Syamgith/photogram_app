import 'package:flutter/material.dart';

AppBar header(context,
    {bool isApptitle = false, String title, bool removebackBtn = false}) {
  return AppBar(
    automaticallyImplyLeading: removebackBtn ? false : true,
    backgroundColor: Theme.of(context).primaryColor,
    centerTitle: isApptitle ? true : false,
    title: Text(
      isApptitle ? 'Friendsgram' : title,
      style: TextStyle(
        fontSize: isApptitle ? 50 : 30,
        fontFamily: isApptitle ? 'signatra' : '',
      ),
    ),
  );
}
