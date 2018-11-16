import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';

class EntryCommentWidget extends StatelessWidget {
  final int commentId;
  EntryCommentWidget({this.commentId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.0, bottom: 2.0, left: 14.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 0.0,
        child: StoreConnector<AppState, EntryComment>(
            converter: (store) =>
                store.state.entitiesState.entryComments[commentId],
            builder: (context, comment) {
              return Column(children: _buildEntryCommentBody(comment));
            }),
      ),
    );
  }

  List<Widget> _buildEntryCommentBody(EntryComment comment) {
    if (comment.embed == null) {
      return [
        AuthorWidget(author: comment.author, date: comment.date),
        BodyWidget(body: comment.body, ellipsize: false),
        EntryCommentFooterWidget(comment: comment),
      ];
    } else {
      return [
        AuthorWidget(author: comment.author, date: comment.date),
        BodyWidget(body: comment.body, ellipsize: false),
        EmbedWidget(embed: comment.embed),
        EntryCommentFooterWidget(comment: comment),
      ];
    }
  }
}
