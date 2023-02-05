import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const messageContainerStyle = BoxDecoration(
  border: Border(
    top: BorderSide(width: 2.0, color: Colors.lightBlueAccent,),
  ),
);
const messageTextDecoration = InputDecoration(
  hintText: 'Enter Message Here...',
  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  border: InputBorder.none,
);