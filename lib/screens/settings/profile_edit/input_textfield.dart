import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class InputTextFieldWidget extends StatelessWidget {
  final bool obscureText;

  InputTextFieldWidget({this.obscureText: false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Utils.backgroundGreyOpacity(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
