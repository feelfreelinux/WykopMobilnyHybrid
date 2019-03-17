import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';

class LinkCommentWidget extends StatelessWidget {
  final int commentId;
  final bool isFirst;
  final bool isLast;
  LinkCommentWidget({
    this.commentId,
    this.isFirst: false,
    this.isLast: false,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LinkComment>(
      key: Key(commentId.toString()),
      converter: (store) => store.state.entitiesState.linkComments[commentId],
      builder: (context, comment) {
        return Container(
          color: Theme.of(context).cardColor,
          child: _buildLinkComment(comment, context),
        );
      },
    );
  }

  Widget _buildLinkComment(LinkComment comment, BuildContext context) {
    return Stack(
      children: <Widget>[
        isFirst
            ? Container()
            : Positioned(
                height: 35.0,
                left: 35.0,
                right: MediaQuery.of(context).size.width - 38.0,
                child: Container(
                  child: Container(
                    width: 4.0,
                    color: Colors.blueGrey.withOpacity(0.4),
                  ),
                ),
              ),
        isLast
            ? Container()
            : Positioned.fill(
                top: 34.0,
                left: 35.0,
                right: MediaQuery.of(context).size.width - 38.0,
                child: Container(
                  child: Container(
                    width: 4.0,
                    color: Colors.blueGrey.withOpacity(0.4),
                  ),
                ),
              ),
        Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            top: 10.0,
            bottom: 10.0,
          ),
          child: AvatarWidget(
            author: comment.author,
            size: 38.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 56.0,
            bottom: 4.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _drawHeader(context, comment),
              BodyWidget(
                body: comment.body,
                ellipsize: false,
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 18.0,
                  bottom: 10.0,
                ),
              ),
              _drawEmbed(comment),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: DividerWidget(
            padding: EdgeInsets.only(
              left: (isFirst && isLast) || isLast ? 18.0 : 68.0,
              right: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawEmbed(LinkComment comment) {
    if (comment.embed != null) {
      return Container(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 18.0,
          bottom: 18.0,
          top: (comment.body != null ? 0.0 : 10.0),
        ),
        child: EmbedWidget(
          embed: comment.embed,
          reducedWidth: 86.0,
          borderRadius: 10.0,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _drawHeader(BuildContext context, LinkComment comment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.0,
              top: 10.0,
              right: 18.0,
              bottom: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    comment.author.login,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Utils.getAuthorColor(comment.author, context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.0),
                  child: Text(
                    Utils.getSimpleDate(comment.date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Theme.of(context).textTheme.caption.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        StoreConnector<AppState, VoidCallback>(
          converter: (store) =>
              () => store.dispatch(voteLinkComment(commentId, false)),
          builder: (context, callback) => VoteButton(
                margin: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                isSelected: comment.voteState == LinkCommentVoteState.UP_VOTED,
                count: comment.voteCountPlus,
                onClicked: () {
                  callback();
                },
              ),
        ),
        StoreConnector<AppState, VoidCallback>(
          converter: (store) =>
              () => store.dispatch(voteLinkComment(commentId, true)),
          builder: (context, callback) => VoteButton(
                negativeIcon: true,
                margin: EdgeInsets.only(
                  left: 4.0,
                  right: 18.0,
                ),
                isSelected:
                    comment.voteState == LinkCommentVoteState.DOWN_VOTED,
                count: -(comment.voteCount - comment.voteCountPlus),
                onClicked: () {
                  callback();
                },
              ),
        ),
      ],
    );
  }
}
