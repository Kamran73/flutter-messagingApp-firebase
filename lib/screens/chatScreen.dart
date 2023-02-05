import 'package:firebaseflashchat/Components/streamBuilder.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late User? user;
class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final textController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String messageText;

  dynamic getCurrentUser() async {
    try {
      user = _auth.currentUser;
      print('the user is ${user!.email}');
    } catch (e) {
      print('in getcurrent exception');
      print(e);
    }
  }

  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('️⚡️Messages'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
               Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuild(mailAddress: user!.email,),
            Container(
              decoration: messageContainerStyle,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: messageTextDecoration,
                      onChanged: (value) {
                        messageText = value;
                      },
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                        await FirebaseFirestore.instance.collection('messages').add({
                        'text': messageText,
                        'sender': user!.email,
                         'timestamp': FieldValue.serverTimestamp(),
                      });
                        textController.clear();
                        print(user!.email);
                    },
                    child: Text(
                      'Send',
                      style: buttonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


