import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EntryCommentWidget extends StatelessWidget {
  final EntryComment comment;
  EntryCommentWidget({this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 14.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 0.0,
        child: Column(
          children: _buildEntryBody(),
        ),
      ),
    );
  }

  List<Widget> _buildEntryBody() {
    if (comment.embed == null) {
      return [
        AuthorWidget(author: comment.author, date: comment.date),
        BodyWidget(body: comment.body),
        EntryCommentFooterWidget(comment: comment),
      ];
    } else {
      return [
        AuthorWidget(author: comment.author, date: comment.date),
        BodyWidget(body: comment.body),
        EmbedWidget(embed: comment.embed),
        EntryCommentFooterWidget(comment: comment),
      ];
    }
  }
}
