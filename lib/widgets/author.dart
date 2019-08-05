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
  AuthorWidget({
    @required this.author,
    @required this.date,
    this.avatarSize: 38.0,
    this.fontSize: 13.0,
    this.padding: const EdgeInsets.only(
      left: 12.0,
      top: 10.0,
      right: 12.0,
      bottom: 6.0,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          AvatarWidget(
            author: author,
            size: avatarSize,
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    author.login,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Utils.getAuthorColor(author.color, context),
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    Utils.getSimpleDate(date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 1.2,
                      color: Theme.of(context).textTheme.caption.color,
                      fontSize: fontSize - 3.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
