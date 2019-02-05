import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'dart:io';

class SpoilerWidget extends StatefulWidget {
  final String text;
  SpoilerWidget({this.text});
  _SpoilerWidgetState createState() => _SpoilerWidgetState();
}

class _SpoilerWidgetState extends State<SpoilerWidget> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    if (expanded) {
      return Container(
        color: Colors.black,
        child: BodyWidget(
          padding: EdgeInsets.all(4),
          blackTheme: true,
          body: Uri.decodeFull(widget.text).replaceAll('+', ' ')),
      );
    } else {
      return GestureDetector(
        onTap: () {
          setState(() {
            expanded = true;
          });
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xa67f7f7f),
            ),
            child: Text('Pokaż spoiler',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.5,
                    color: Colors.white))),
      );
    }
  }
}
