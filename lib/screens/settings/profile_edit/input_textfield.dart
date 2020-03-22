import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class InputTextFieldWidget extends StatelessWidget {
  final bool obscureText;
  final int maxLines;

  InputTextFieldWidget({this.obscureText: false, this.maxLines = 1});

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
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
