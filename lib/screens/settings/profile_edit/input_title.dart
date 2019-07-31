import 'package:flutter/material.dart';

class InputTitleWidget extends StatelessWidget {
  final String text;

  InputTitleWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}
