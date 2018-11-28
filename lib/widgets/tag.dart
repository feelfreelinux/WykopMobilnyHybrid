import 'package:flutter/material.dart';

/**
 * Shows a tag in mikroblog text. 
 */
class TagWidget extends StatelessWidget {
  final String tag;
  TagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              new LinearGradient(colors: <Color>[Colors.red, Colors.blue]),
          borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text('#' + this.tag,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
      ),
    );
  }
}
