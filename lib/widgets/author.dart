import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class AuthorWidget extends StatelessWidget {
  final Author author;
  final String date;
  final double avatarSize;
  final double fontSize;
  final EdgeInsets padding;
  AuthorWidget(
      {@required this.author,
      @required this.date,
      this.avatarSize: 38,
      this.fontSize: 13.0,
      this.padding: const EdgeInsets.only(
          left: 12.0, top: 10.0, right: 12.0, bottom: 8.0)});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: Row(children: <Widget>[
          AvatarWidget(author: author, size: avatarSize),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                    child: Text(author.login,
                        style: TextStyle(
                            color: Utils.getAuthorColor(author, context),
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600))),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 10.0),
                    child: Text(Utils.getSimpleDate(date),
                        style: TextStyle(
                            color: Theme.of(context).textTheme.caption.color,
                            fontSize: fontSize - 2.5,
                            fontWeight: FontWeight.w300)))
              ])
        ]));
  }
}
