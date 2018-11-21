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
                color: stateBackgroundColor),
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

  Color get stateBackgroundColor {
    if (isSelected) {
      if (negativeIcon) {
        return Color(0xCCc0392b);
      } else {
        return Color(0xCC3b915f);
      }
    } else {
      if (negativeIcon) {
        return Color(0x26c0392b);
      } else {
        return Color(0x263b915f);
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
