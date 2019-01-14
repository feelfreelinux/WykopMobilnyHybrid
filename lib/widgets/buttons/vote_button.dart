import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/shiny_backdrop.dart';
import 'package:owmflutter/widgets/widgets.dart';

class VoteButton extends StatefulWidget {
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
      this.padding: const EdgeInsets.all(4.0)});

  @override
  VoteButtonState createState() {
    return new VoteButtonState();
  }
}

class VoteButtonState extends State<VoteButton> {
  double scrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ShinyBackdrop(
                    extent: 100.0,
                    child: Container(),
                    gradientCreator: (double parallaxValue) {
                      var offset = Alignment(parallaxValue, 0);
                      return LinearGradient(
                        colors: List.from(stateGradientColor)
                          ..addAll(stateGradientColor.reversed.toList()),
                        stops: [0, 0.50, 0.50, 1],
                        begin: Alignment.topLeft.add(offset),
                        end: Alignment.bottomCenter.add(offset),
                      );
                    },
                  )),
              Container(
                  padding: widget.padding,
                  child: Row(children: <Widget>[
                    Icon(
                        (widget.negativeIcon
                            ? OwmGlyphs.ic_buttontoolbar_minus
                            : OwmGlyphs.ic_buttontoolbar_plus),
                        size: widget.fontSize * 1.19,
                        color: stateTextColor),
                    Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Text(widget.count.toInt().toString(),
                            style: TextStyle(
                                color: stateTextColor,
                                fontSize: widget.fontSize,
                                fontWeight: FontWeight.w500)))
                  ])),
            ],
          ),
        ),
        onTapDown: (_) {
          ActiveGestureDetectorWidget.of(context).changeState(false);
        },
        onTapUp: (_) {
          ActiveGestureDetectorWidget.of(context).changeState(true);
        },
        onTap: () {
          this.widget.onClicked();
        });
  }

  List<Color> get stateGradientColor {
    if (widget.isSelected) {
      if (widget.negativeIcon) {
        return [const Color(0xCCC0392B), const Color(0xCC8D3D77)]; // - active
      } else {
        return [const Color(0xCC007672), const Color(0xCC3B915F)]; // + active
      }
    } else {
      if (widget.negativeIcon) {
        return [const Color(0x26C0392B), const Color(0x268D3D77)]; // -
      } else {
        return [const Color(0x003B915F), const Color(0x00007672)]; // +
      }
    }
  }

  Color get stateTextColor {
    if (widget.isSelected) {
      return Color(0xffffffff);
    } else {
      if (widget.negativeIcon) {
        return Color(0xffc0392b);
      } else {
        return Color(0xff3b915f);
      }
    }
  }
}
