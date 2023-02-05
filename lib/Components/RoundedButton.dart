import 'package:flutter/material.dart';
class RoundedButton extends StatelessWidget {
  RoundedButton({this.color= Colors.white, this.text='SignIn', required this.onPressed});
  final String text;
  final Color color;
  final dynamic onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(
            '$text',
            style: TextStyle(color: Colors.white),
          ),
          minWidth: 200,
          height: 38,
        ),
      ),
    );
  }
}
