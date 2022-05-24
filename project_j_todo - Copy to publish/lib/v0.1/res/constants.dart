import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const EdgeInsets kTaskScreenPadding = EdgeInsets.only(
  top: 60,
  left: 30,
  right: 30,
  bottom: 30,
);

const Color kMainColor = Colors.lightBlueAccent;

const double kSF = 1;

const kTaskTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
const kAddTaskFont = TextStyle(
    fontSize: 33, fontWeight: FontWeight.w300, color: Colors.lightBlueAccent);
const kTaskListDeco = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);
