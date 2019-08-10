import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';

class AuthorWidget extends StatefulWidget {
  final Author author;
  final String date;
  final double avatarSize;
  final double fontSize;
  final EdgeInsets padding;
  final bool showUserDialog;

  AuthorWidget({
    @required this.author,
    @required this.date,
    this.avatarSize: 38.0,
    this.fontSize: 13.0,
    this.padding:
        const EdgeInsets.only(left: 12.0, top: 10.0, right: 12.0, bottom: 6.0),
    this.showUserDialog: true,
  });

  _AuthorWidgetState createState() => _AuthorWidgetState();
}

class _AuthorWidgetState extends State<AuthorWidget> {
  bool showFullDate = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: widget.showUserDialog
                ? () => showDialog(
                      context: context,
                      builder: (_) => UserDialogWidget(author: widget.author),
                    )
                : null,
            child: AvatarWidget(
              author: widget.author,
              size: widget.avatarSize,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: widget.showUserDialog
                        ? () => showDialog(
                              context: context,
                              builder: (_) =>
                                  UserDialogWidget(author: widget.author),
                            )
                        : null,
                    child: Text(
                      widget.author.login,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color:
                            Utils.getAuthorColor(widget.author.color, context),
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      showFullDate = !showFullDate;
                    }),
                    child: Text(
                      showFullDate
                          ? Utils.getDateFormat(
                              widget.date, 'dd.MM.yyyy \'o\' HH:mm:ss')
                          : Utils.getSimpleDate(widget.date),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.2,
                        color: Theme.of(context).textTheme.caption.color,
                        fontSize: widget.fontSize - 3.0,
                        fontWeight: FontWeight.w400,
                      ),
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
