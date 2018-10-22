import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';

class AuthorWidget extends StatelessWidget {
  final Author author;
  final String date;
  AuthorWidget({this.author, this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
              width: 30.0,
              height: 30.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(author.avatar)))),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(author.login, style: TextStyle(color: Utils.getAuthorColor(author, context)))),
              new Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Text(Utils.getSimpleDate(date), style: TextStyle(fontSize: 10.0, color: Theme.of(context).textTheme.caption.color))),
              ]),
            
        ],
      ),
    );
  }
}
