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
                left: 35.5,
                right: MediaQuery.of(context).size.width - 38.5,
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
                left: 35.5,
                right: MediaQuery.of(context).size.width - 38.5,
                child: Container(
                  child: Container(
                    width: 4.0,
                    color: Colors.blueGrey.withOpacity(0.4),
                  ),
                ),
              ),
        Padding(
          padding: EdgeInsets.only(
            left: 18.0,
            top: 10.0,
            bottom: 10.0,
          ),
          child: AvatarWidget(
            author: comment.author,
            size: 36.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 56.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _drawHeader(context, comment),
              BodyWidget(
                body: comment.body,
                ellipsize: false,
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
          right: 12.0,
          bottom: 18.0,
          top: (comment.body != null ? 0.0 : 10.0),
        ),
        child: EmbedWidget(
          embed: comment.embed,
          reducedWidth: 84.0,
          borderRadius: 10.0,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _drawHeader(BuildContext context, LinkComment comment) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        top: 8.0,
        right: 18.0,
        bottom: 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    child: Text(
                      comment.author.login,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Utils.getAuthorColor(comment.author, context),
                      ),
                    ),
                  ),
                ),
                Text(
                  "  •  " + Utils.getSimpleDate(comment.date),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).textTheme.caption.color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: StoreConnector<AppState, VoidCallback>(
              converter: (store) => () => {},
              builder: (context, callback) => VoteButton(
                    isSelected: comment.isVoted,
                    count: comment.voteCountPlus,
                    onClicked: () {
                      callback();
                    },
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: StoreConnector<AppState, VoidCallback>(
              converter: (store) => () => {},
              builder: (context, callback) => VoteButton(
                    negativeIcon: true,
                    isSelected: comment.isVoted,
                    count: -(comment.voteCount - comment.voteCountPlus),
                    onClicked: () {
                      callback();
                    },
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
