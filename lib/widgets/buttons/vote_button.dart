import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/shiny_backdrop.dart';
import 'package:owmflutter/models/entry.dart';

import 'dart:async';

typedef Future VoteButtonCallback();

class VoteButton extends StatefulWidget {
  final VoteButtonCallback callback;
  final Entry data;
  final bool negativeIcon = false;

  VoteButton(this.data, this.callback);

  @override
  VoteButtonState createState() {
    return new VoteButtonState();
  }
}


class VoteButtonState extends State<VoteButton> {
  bool isLoading = false;
  double fontSize = 14.0;
  EdgeInsets padding = EdgeInsets.all(4.0);

  void _vote() {
    setState(() { isLoading = true;});
    this.widget.callback()
    .then((_) => setState(() { isLoading = false;}));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      onTap: () { this._vote(); },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: _brawButton(),
        ),
      ),
    );
  }



  List<Widget> _brawButton () {
    return <Widget>[
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
        ),
      ),
      this.isLoading
        ? SizedBox( 
          child: CircularProgressIndicator(strokeWidth: 3.0,),
          height: 10.0,
          width: 10.0,
        )
        : Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            Icon((
              widget.negativeIcon
                  ? OwmGlyphs.ic_buttontoolbar_minus
                  : OwmGlyphs.ic_buttontoolbar_plus),
              size: fontSize * 1.19,
              color: stateTextColor
            ),
            Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Text(
                widget.data.commentsCount.toInt().toString(),
                style: TextStyle(
                  color: stateTextColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Color> get stateGradientColor {
    if (widget.data.isVoted) {
      if (widget.negativeIcon) {
        return [const Color(0xCCC0392B), const Color(0xCC8D3D77)]; // - active
      } else {
        return [const Color(0xCC007672), const Color(0xCC3B915F)]; // + active
      }
    } else {
      if (widget.negativeIcon) {
        return [const Color(0x26C0392B), const Color(0x268D3D77)]; // -
      } else {
        return [const Color(0x263B915F), const Color(0x26007672)]; // +
      }
    }
  }

  Color get stateTextColor {
    if (widget.data.isVoted) {
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


