import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';

class TopLinkCommentWidget extends StatelessWidget {
  final int commentId;
  TopLinkCommentWidget({this.commentId});

  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key(commentId.toString()),
        color: Theme.of(context).cardColor,
        child: StoreConnector<AppState, LinkComment>(
            converter: (store) =>
                store.state.entitiesState.linkComments[commentId],
            builder: (context, comment) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: comment.childrenIds.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                          key: Key(commentId.toString()),
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Material(
                              color: Theme.of(context).cardColor,
                              child: Column(
                                  children: _buildLinkComment(comment))));
                    }

                    return ChildrenLinkCommentWidget(
                        commentId: comment.childrenIds[index - 1]);
                  });
            }));
  }

  List<Widget> _buildLinkComment(LinkComment comment) {
    return [
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AuthorWidget(
                author: comment.author, date: comment.date, fontSize: 14),
            Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (state) => () => {},
                  builder: (context, callback) => VoteButton(
                      isSelected: comment.isVoted,
                      count: comment.voteCount,
                      onClicked: () {
                        callback();
                      }),
                ))
          ]),
      _drawBody(comment),
      _drawEmbed(comment),
      Container(
        color: Color(0x1A7F7F7F),
        height: 0.8,
      )
    ];
  }

  Widget _drawBody(LinkComment comment) {
    if (comment.body != null) {
      return BodyWidget(
        body: comment.body,
        ellipsize: false,
        padding:
            EdgeInsets.only(left: 12.0, right: 12.0, bottom: 4.0, top: 4.0),
      );
    } else {
      return Container();
    }
  }

  Widget _drawEmbed(LinkComment comment) {
    if (comment.embed != null) {
      return Container(
          padding: EdgeInsets.only(top: 6.0),
          child: EmbedWidget(embed: comment.embed));
    } else {
      return Container();
    }
  }
}
