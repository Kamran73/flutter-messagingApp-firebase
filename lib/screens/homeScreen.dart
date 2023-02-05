import 'package:firebaseflashchat/Components/RoundedButton.dart';
import 'package:firebaseflashchat/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Color _value = Colors.white;

  void startFirebase ()async{
    await Firebase.initializeApp();
  }
  @override
  void initState() {
    try{
      startFirebase();
    }
    catch(e){
      print(e);
    }
    setState(() {
    });
    super.initState();
    AnimationController controller;
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Animation animation =
    ColorTween(begin: Colors.blueAccent, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
        _value = animation.value;
      });
      print(animation.value);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                Text(
                  'Flash_Chat',
                  style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.black54),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
                print('sign in using parameters');
              },
              color: Colors.lightBlueAccent,
              text: 'Sign In',
            ),
            RoundedButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              color: Colors.blueAccent,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
