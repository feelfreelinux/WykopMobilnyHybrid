import 'package:flutter/material.dart';

class InputButtonWidget extends StatelessWidget {
  final String text;
  final bool fullWidth;

  InputButtonWidget({this.text, this.fullWidth: true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        constraints: fullWidth ? BoxConstraints(minWidth: double.infinity) : null,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        margin: EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
