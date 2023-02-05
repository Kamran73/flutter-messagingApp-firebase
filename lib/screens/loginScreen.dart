import 'package:firebaseflashchat/Components/CustomPasswordField.dart';
import 'package:firebaseflashchat/Components/CustomTextField.dart';
import 'package:firebaseflashchat/Components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chatScreen.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  IconData _iconData= Icons.visibility;
  bool isObsecure = true;
  FirebaseAuth _auth= FirebaseAuth.instance;
  String Mail = '123@abc.com';
  String Password = '123';
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                CustomTextField(hint: 'Enter Mail',onChanged: (value){
                  Mail  = value;
                },),
                CustomPasswordField(
                  iconData: _iconData,
                  isObsecure: isObsecure,
                  onIconpress: (){
                    if(isObsecure == true){
                      setState(() {
                        isObsecure = false;
                        _iconData = Icons.visibility_off;
                      });
                    }
                    else if(isObsecure == false){
                      setState(() {
                        isObsecure = true;
                        _iconData = Icons.visibility;
                      });
                    }
                  },
                  hint: 'Enter Password',
                  onChanged: (value){
                    Password = value;
                  },
                ),
                RoundedButton(
                  onPressed: () async{
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                      await _auth.signInWithEmailAndPassword(email: Mail, password: Password);
                      print(Mail);
                      print(Password);
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    catch(e){
                      print(e);
                    }
                  },
                  color: Colors.blueAccent,
                  text: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
