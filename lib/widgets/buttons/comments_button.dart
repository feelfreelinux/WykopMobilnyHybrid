import 'package:flutter/material.dart';
import 'package:owmflutter/owm_glyphs.dart';

class CommentsButton extends StatelessWidget {
  final num count;
  final VoidCallback onClicked;

  CommentsButton({@required this.count, this.onClicked});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(left: 6.0, right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 1.5),
                  child: Icon(OwmGlyphs.ic_buttontoolbar_comment,
                      size: 14.0,
                      color: Theme.of(context).textTheme.caption.color)),
              Text(
                count.toInt().toString() + " " + _polishPlural(count.toInt()),
                style: TextStyle(
                    fontSize: 12.5,
                    color: Theme.of(context).textTheme.caption.color),
              ),
            ],
          )),
      onTap: this.onClicked,
    );
  }

  String _polishPlural(value) {
    if (value == 1) {
      return "komentarz";
    } else if (value % 10 >= 2 &&
        value % 10 <= 4 &&
        (value % 100 < 10 || value % 100 >= 20)) {
      return "komentarze";
    } else {
      return "komentarzy";
    }
  }
}
