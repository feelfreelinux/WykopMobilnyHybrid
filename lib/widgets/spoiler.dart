import 'package:flutter/material.dart';

class SpoilerWidget extends StatelessWidget {
  const SpoilerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xa67f7f7f),
        ),
        child: Text('Pokaż spoiler',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.5,
                color: Colors.white)));
  }
}
