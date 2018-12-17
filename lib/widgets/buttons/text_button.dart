import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;
  TextButton(
      {@required this.text, @required this.icon, @required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 2.0, top: 1.0),
                      child: Icon(icon,
                          size: 17.0,
                          color: Theme.of(context).textTheme.caption.color)),
                  Text(text,
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.caption.color))
                ])),
        onTap: this.onClicked);
  }
}
