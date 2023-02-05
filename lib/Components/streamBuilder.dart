import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'messageDecorator.dart';

class StreamBuild extends StatefulWidget {
  StreamBuild({required this.mailAddress});

  final dynamic mailAddress;

  @override
  _StreamBuildState createState() => _StreamBuildState();
}

class _StreamBuildState extends State<StreamBuild> {
  bool checkIsMe(dynamic mail) {
    if (widget.mailAddress == mail)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('messages').orderBy('timestamp', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs.reversed;
          late List<MessageDecorator> messageWidgets = [];
          for (var message in messages) {
            messageWidgets.add(
              MessageDecorator(
                message: message['text'],
                sender: message['sender'],
                isMe: checkIsMe(message['sender']),
              ),
            );
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
              children: messageWidgets,
            ),
          );
        }
        else
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
            children: [

            ],
          ),
        );
      },
    );
  }
}
