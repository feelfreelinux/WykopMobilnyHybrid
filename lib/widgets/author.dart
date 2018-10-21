import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  final EntryAuthor author;
  AuthorWidget({this.author});

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
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(author.avatar)))),
          new Container(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(author.login),
          )
        ],
      ),
    );
  }
}
