import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class VoteButton extends StatefulWidget {
  final VoidCallback onClicked;
  final num count;
  final isSelected;
  final bool negativeIcon;
  final bool onlyIcon;
  final double fontSize;
  final EdgeInsets padding;
  VoteButton({
    @required this.onClicked,
    @required this.isSelected,
    this.count,
    this.negativeIcon: false,
    this.onlyIcon: false,
    this.fontSize: 14.0,
    this.padding: const EdgeInsets.all(4.0),
  });

  @override
  VoteButtonState createState() {
    return new VoteButtonState();
  }
}

class VoteButtonState extends State<VoteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Utils.voteBackgroundStateColor(
            isSelected: widget.isSelected,
            negativeIcon: widget.negativeIcon,
          ),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              (widget.negativeIcon
                  ? OwmGlyphs.ic_buttontoolbar_minus
                  : OwmGlyphs.ic_buttontoolbar_plus),
              size: widget.fontSize * 1.19,
              color: Utils.voteIconStateColor(
                isSelected: widget.isSelected,
                negativeIcon: widget.negativeIcon,
              ),
            ),
            widget.onlyIcon
                ? Container()
                : Padding(
                    padding: EdgeInsets.only(
                      right: 4.0,
                    ),
                    child: Text(
                      widget.count.toInt().toString(),
                      style: TextStyle(
                        color: Utils.voteIconStateColor(
                          isSelected: widget.isSelected,
                          negativeIcon: widget.negativeIcon,
                        ),
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
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
      },
    );
  }
}
