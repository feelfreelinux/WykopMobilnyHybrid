import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/widgets.dart';

class SpoilerWidget extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;

  SpoilerWidget({
    this.text,
    this.textColor,
    this.textSize,
  });

  _SpoilerWidgetState createState() => _SpoilerWidgetState();
}

class _SpoilerWidgetState extends State<SpoilerWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: expanded
          ? BodyWidget(
              textColor: widget.textColor,
              textSize: widget.textSize,
              body: Uri.decodeFull(widget.text).replaceAll('+', ' '),
              //TODO: Klikalne linki w spoilerach
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 6.0),
                  child: Icon(
                    Icons.visibility,
                    size: (widget.textSize ?? 14.0) * 1.2,
                    color: widget.textColor,
                  ),
                ),
                Text(
                  'Pokaż spoiler',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: widget.textSize,
                    color: widget.textColor,
                  ),
                ),
              ],
            ),
    );
  }
}
