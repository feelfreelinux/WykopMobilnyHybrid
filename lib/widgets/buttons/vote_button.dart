import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class VoteButton extends StatelessWidget {
  final VoidCallback onClicked;
  final num count;

  VoteButton({@required this.count, @required this.onClicked});
  @override
    Widget build(BuildContext context) {
      return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(OwmGlyphs.ic_buttontoolbar_plus,
                  size: 20.0, color: Theme.of(context).textTheme.caption.color),
              Text(
                count.toInt().toString(),
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).textTheme.caption.color),
              ),
            ],
          )),
      onTap: this.onClicked,
    );
    }
}