import 'package:flutter/material.dart';
import 'package:owmflutter/screens/screens.dart';

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
  "neuropa": [Colors.red, Color.fromARGB(255, 240, 240, 240)]
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

    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return TagScreen(tag: tag);
                  },
                  transitionsBuilder: (context, animation1, animation2, child) {
                    return FadeTransition(
                        opacity: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(animation1),
                        child: child);
                  },
                  transitionDuration: Duration(milliseconds: 400)));
        },
        child: Container(
            margin: EdgeInsets.only(top: 0.4, bottom: 1.0),
            padding:
                EdgeInsets.only(left: 5.5, top: 1.0, right: 5.5, bottom: 2.0),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blueAccent, Colors.blue]),
                borderRadius: BorderRadius.circular(20.0)),
            child: Text('#' + this.tag,
                style: TextStyle(color: Colors.white, fontSize: 13.0))));
  }
}
