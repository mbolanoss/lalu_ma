import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar UpperAppBar (BuildContext context){
  final menuIcon = CupertinoIcons.ellipsis_vertical;
  final backIcon = CupertinoIcons.back;
  return AppBar(
    leading: IconButton(
        onPressed: () {}, 
        icon: Icon(backIcon)),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        onPressed: () {}, 
        icon: Icon(menuIcon)
        )
    ],
  );
}