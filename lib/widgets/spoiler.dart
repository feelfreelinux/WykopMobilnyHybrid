import 'package:flutter/material.dart';

class SpoilerWidget extends StatelessWidget {
  const SpoilerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text('Spoiler'),
      ),
    );
  }
}
