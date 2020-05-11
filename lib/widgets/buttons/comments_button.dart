import 'package:flutter/material.dart';
import 'package:owmflutter/utils/utils.dart';

class CommentsButton extends StatelessWidget {
  final num count;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  CommentsButton(
      {@required this.count, @required this.onTap, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress ?? null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.centerRight,
          color: Colors.transparent,
          child: Text(
            count.toString() +
                " " +
                Utils.polishPlural(
                  count: count,
                  first: "komentarz",
                  many: "komentarzy",
                  other: "komentarze",
                ),
            style: TextStyle(
              fontSize: 16.0,
              color: Theme.of(context).textTheme.caption.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
