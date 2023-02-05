import 'package:firebaseflashchat/screens/chatScreen.dart';
import 'package:firebaseflashchat/screens/homeScreen.dart';
import 'package:firebaseflashchat/screens/loginScreen.dart';
import 'package:firebaseflashchat/screens/registerScreen.dart';
import 'package:flutter/material.dart';
void main() => runApp(
  MaterialApp(
    initialRoute: HomeScreen.id,
    routes: {
      HomeScreen.id: (context) => HomeScreen(),
      LoginScreen.id : (context) => LoginScreen(),
      RegisterScreen.id :(context) => RegisterScreen(),
      ChatScreen.id: (context) => ChatScreen(),
    },
  ),
);