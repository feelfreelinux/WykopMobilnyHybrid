import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  TextButton({@required this.text, @required this.icon, @required this.onClicked});
  @override
    Widget build(BuildContext context) {
      return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon,
                  size: 20.0, color: Theme.of(context).textTheme.caption.color),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).textTheme.caption.color),
              ),
            ],
          )),
      onTap: this.onClicked,
    );
    }
}