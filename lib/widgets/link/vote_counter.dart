import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class VoteCounterWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String voteState;
  final num count;
  final bool isHot;
  final double size;
  final EdgeInsets padding;

  VoteCounterWidget({
    @required this.onClicked,
    @required this.voteState,
    @required this.count,
    @required this.isHot,
    this.size: 48.0,
    this.padding: const EdgeInsets.all(0.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onClicked,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(1.0),
              width: size,
              height: size / 1.28,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _frameColor,
                  width: 3.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            _hotIcon(context),
            Text(
              count.toString(),
              style: TextStyle(
                letterSpacing: -(size / 100.00),
                fontSize: (size / 3.45),
                fontWeight: FontWeight.w700,
                color: Color(0xffff5917),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hotIcon(BuildContext context) {
    if (isHot) {
      return Positioned(
        top: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.only(
            bottom: (size / 32),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Icon(
            OwmGlyphs.ic_hot,
            size: (size / 3.7),
            color: Colors.red,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Color get _frameColor {
    if (voteState == "dig") {
      return Color(0xff3b915f);
    } else if (voteState == "bury") {
      return Color(0xffc0392b);
    } else {
      return Color(0xff4383af);
    }
  }
}
