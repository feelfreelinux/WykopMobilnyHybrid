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
      padding: EdgeInsets.only(left: 12.0, bottom: 4.0, right: 12.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(author.avatar)))),
                new Container(
                  padding: EdgeInsets.only(top: 1.0),
                  child: SizedBox(
                    width: 32.0,
                    height: 1.6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: author.sex == AuthorSex.MALE ? Colors.blue : author.sex == AuthorSex.FEMALE ? Colors.pink : Colors.transparent),
                    ))),
              ],
            ),
          ),
          new Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            new Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                child: Text(author.login,
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Utils.getAuthorColor(author, context)))),
            new Container(
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
