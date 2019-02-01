import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';

class ChildrenLinkCommentWidget extends StatelessWidget {
  final int commentId;
  final bool isFirst;
  final bool isLast;
  ChildrenLinkCommentWidget({this.commentId, this.isFirst, this.isLast});

  @override
  Widget build(BuildContext context) {
    return Material(
        key: Key(commentId.toString()),
        color: Theme.of(context).cardColor,
        child: StoreConnector<AppState, LinkComment>(
            converter: (store) =>
                store.state.entitiesState.linkComments[commentId],
            builder: (context, comment) {
              return Column(children: _buildLinkComment(comment, context));
            }));
  }

  List<Widget> _buildLinkComment(LinkComment comment, BuildContext context) {
    return [
      //InkWell(child:
      Column(children: <Widget>[
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 12.0, top: 10.0, bottom: 10.0),
              child: AvatarWidget(
                  author: comment.author, size: 44.0, genderVisibility: true)),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                _drawHeader(context, comment),
                _drawBody(comment),
                _drawEmbed(comment)
              ]))
        ]),
        Container(
          color: Color(0x1A7F7F7F),
          height: 0.8,
          margin: EdgeInsets.only(left: 70.0, right: 12.0),
        )
      ]),
      //onTap: () {},
      //onDoubleTap: () {},
      //onLongPress: () {})
    ];
  }

  Widget _drawBody(LinkComment comment) {
    if (comment.body != null) {
      return BodyWidget(body: comment.body, ellipsize: false);
    } else {
      return Container();
    }
  }

  Widget _drawEmbed(LinkComment comment) {
    if (comment.embed != null) {
      return Container(
          padding: EdgeInsets.only(
              left: 12.0,
              right: 12.0,
              bottom: 18.0,
              top: (comment.body != null ? 0.0 : 10.0)),
          child: EmbedWidget(
            embed: comment.embed,
            reducedWidth: 84.0,
            borderRadius: 10.0,
          ));
    } else {
      return Container();
    }
  }

  Widget _drawHeader(BuildContext context, LinkComment comment) {
    return Padding(
        padding: EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0, bottom: 2),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Row(children: <Widget>[
                Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                        child: Text(comment.author.login,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Utils.getAuthorColor(
                                    comment.author, context))))),
                Text("  •  " + Utils.getSimpleDate(comment.date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.caption.color))
              ])),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (store) => () => {},
                  builder: (context, callback) => VoteButton(
                      isSelected: comment.isVoted,
                      count: comment.voteCountPlus,
                      onClicked: () {
                        callback();
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: StoreConnector<AppState, VoidCallback>(
                  converter: (store) =>
                      () => {},
                  builder: (context, callback) => VoteButton(
                    negativeIcon: true,
                      isSelected: comment.isVoted,
                      count: -(comment.voteCount - comment.voteCountPlus),
                      onClicked: () {
                        callback();
                      }),
                ),
              )
            ]));
  }
}
