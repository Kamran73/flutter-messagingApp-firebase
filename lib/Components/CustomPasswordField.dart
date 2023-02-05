import 'package:flutter/material.dart';
class CustomPasswordField extends StatelessWidget {
  CustomPasswordField({required this.hint, required this.onChanged, required this.iconData,required this.isObsecure, required this.onIconpress});
  final String hint;
  final dynamic onChanged;
  dynamic iconData ;
  bool isObsecure ;
  final dynamic onIconpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        obscureText: isObsecure,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: onIconpress,
            icon: Icon(iconData),
          ),
          hintText: hint,
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.lightBlueAccent, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(32.0)),
          ),
        ),
      ),
    );
  }
}
