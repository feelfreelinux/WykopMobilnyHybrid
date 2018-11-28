import 'package:flutter/material.dart';
import 'package:color/color.dart' as bColor;

var colorCombinations = <List<Color>>[
  [Colors.black, Colors.blue],
  [Colors.indigo, Colors.green],
  [Colors.deepOrange, Colors.black],
  [Colors.purple, Colors.green],
  [Colors.red, Colors.grey.shade300]
];

var colorOverrides = {
  "4konserwy": [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple
  ],
  "neuropa": [Colors.red, Colors.white]
};

/**
 * Shows a tag in mikroblog text. Each tag has its own colors assigned.
 */
class TagWidget extends StatelessWidget {
  final String tag;
  TagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    var hc = this.tag.hashCode;
    var gradient =
        colorCombinations[(hc / 2).floor() % colorCombinations.length];
    if (hc % 2 == 1) {
      gradient = gradient.reversed.toList();
    }

    if (colorOverrides.containsKey(this.tag)) {
      gradient = colorOverrides[this.tag];
    }

    return Container(
      decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: gradient,
          ),
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
