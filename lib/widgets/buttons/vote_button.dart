import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class VoteButton extends StatelessWidget {
  final VoidCallback onClicked;
  final num count;
  final isSelected;
  final bool negativeIcon;
  final double fontSize;
  final EdgeInsets padding;
  VoteButton(
      {@required this.onClicked,
      @required this.count,
      @required this.isSelected,
      this.negativeIcon: false,
      this.fontSize: 14.0,
      this.padding: const EdgeInsets.all(4)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(30),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: stateGradientColor)),
            padding: padding,
            child: Row(children: <Widget>[
              Icon(
                  (negativeIcon
                      ? OwmGlyphs.ic_buttontoolbar_minus
                      : OwmGlyphs.ic_buttontoolbar_plus),
                  size: fontSize * 1.19,
                  color: stateTextColor),
              Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Text(count.toInt().toString(),
                      style: TextStyle(
                          color: stateTextColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w500)))
            ])),
        onTap: this.onClicked);
  }

  List<Color> get stateGradientColor {
    if (isSelected) {
      if (negativeIcon) {
        return [const Color(0xCCC0392B), const Color(0xCC8D3D77)];
      } else {
        return [const Color(0xCC3B915F), const Color(0xCC007672)];
      }
    } else {
      if (negativeIcon) {
        return [const Color(0x26C0392B), const Color(0x268D3D77)];
      } else {
        return [const Color(0x263B915F), const Color(0x26007672)];
      }
    }
  }

  Color get stateTextColor {
    if (isSelected) {
      return Color(0xffffffff);
    } else {
      if (negativeIcon) {
        return Color(0xffc0392b);
      } else {
        return Color(0xff3b915f);
      }
    }
  }
}
