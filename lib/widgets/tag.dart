import 'package:flutter/material.dart';
import 'package:color/color.dart' as bColor;

// var colorCombinations = <List<Color>>[
//   [Colors.black, Colors.blue],
//   [Colors.indigo, Colors.green],
//   [Colors.deepOrange, Colors.black],
//   [Colors.purple, Colors.green],
//   [Colors.red, Colors.grey.shade300]
// ];

/**
 * Shows a tag in mikroblog text. Each tag has its own colors assigned.
 */
class TagWidget extends StatelessWidget {
  final String tag;
  TagWidget(this.tag);

  @override
  Widget build(BuildContext context) {
    var hc = this.tag.hashCode;
    // var col = colorCombinations[(hc / 2).floor() % colorCombinations.length];
    // if(hc % 2 == 1) {
    //   col = col.reversed.toList();
    //}
    var dark = hc % 2 == 1;
    hc = (hc / 2).floor();
    var saturation = 50;
    var luminance = dark ? 30 : 80;

    var colors = <bColor.RgbColor>[
      bColor.Color.hsl(hc % 360, saturation, luminance).toRgbColor(),
      bColor.Color.hsl((hc + 120) % 360, saturation, luminance).toRgbColor()
    ];
    var gradient =
        colors.map((col) => Color.fromARGB(255, col.r, col.g, col.b)).toList();
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
                color: dark ? Color.fromARGB(230, 255, 255, 255) : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12.0)),
      ),
    );
  }
}
