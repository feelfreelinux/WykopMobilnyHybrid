import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class AuthorWidget extends StatelessWidget {
  final Author author;
  final String date;
  AuthorWidget({this.author, this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, bottom: 4.0, right: 12.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AvatarWidget(author: author, size: 38, visibility: true),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                child: Text(author.login,
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Utils.getAuthorColor(author, context)))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                child: Text(Utils.getSimpleDate(date),
                    style: TextStyle(
                        fontSize: 11.0,
                        color: Theme.of(context).textTheme.caption.color))),
          ]),
        ],
      ),
    );
  }
}
