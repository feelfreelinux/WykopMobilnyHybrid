import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentsButton extends StatelessWidget {
  final num count;
  final VoidCallback onClicked;
  CommentsButton({@required this.count, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: 6.0,
              ),
              child: Icon(
                FontAwesomeIcons.comment,
                size: 16.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
            Text(
              count.toString() + " " + _polishPlural(count),
              style: TextStyle(
                fontSize: 13.0,
                color: Theme.of(context).textTheme.caption.color,
              ),
            ),
          ],
        ),
      ),
      onTap: this.onClicked,
    );
  }

  String _polishPlural(num value) {
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
