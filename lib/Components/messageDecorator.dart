import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDecorator extends StatelessWidget {
  MessageDecorator({required this.message, required this.sender, required this.isMe});

  final String message;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    if(isMe == true){
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(sender, style: TextStyle(fontSize: 10, color: Colors.black54),),
            Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.lightBlueAccent,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  '$message',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    }
    else
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender, style: TextStyle(fontSize: 10, color: Colors.black54),),
            Material(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blueGrey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(
                  '$message',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );

  }
}