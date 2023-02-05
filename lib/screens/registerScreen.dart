import 'package:firebaseflashchat/Components/CustomPasswordField.dart';
import 'package:firebaseflashchat/Components/CustomTextField.dart';
import 'package:firebaseflashchat/Components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'chatScreen.dart';
class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showSpinner = false;
  dynamic newUser;
  final _auth = FirebaseAuth.instance;
  IconData _iconData= Icons.visibility;
  bool isObsecure = true;
  String fullname = 'no name';
  String Email = '123@abc.com';
  String Password = '123';
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
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 100,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                CustomTextField(
                  hint: 'Enter Full Name',
                  onChanged: (value){
                    fullname = value;
                  },
                ),
                CustomTextField(
                  hint: 'Enter Email',
                  onChanged: (value){
                    Email = value;
                  },
                ),
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
                    print(fullname);
                    print(Email);
                    print(Password);
                    try{
                      newUser = await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
                      setState(() {
                        showSpinner = false;
                      });
                      Navigator.pushNamed(context, ChatScreen.id);

                    }
                    catch(e){
                      print('you are in catched block');
                      print(e);
                    }
                  },
                  color: Colors.blueAccent,
                  text: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
