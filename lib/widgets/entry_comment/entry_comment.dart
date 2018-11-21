import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';

class EntryCommentWidget extends StatelessWidget {
  final int commentId;
  EntryCommentWidget({this.commentId});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 1.0),
        child: Material(
            color: Theme.of(context).cardColor,
            child: StoreConnector<AppState, EntryComment>(
                converter: (store) =>
                    store.state.entitiesState.entryComments[commentId],
                builder: (context, comment) {
                  return Column(
                      children: _buildEntryCommentBody(comment, context));
                })));
  }

  List<Widget> _buildEntryCommentBody(
      EntryComment comment, BuildContext context) {
    return [
      //InkWell(
      //child:
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 10),
            child: AvatarWidget(
                author: comment.author, size: 44.0, genderVisibility: true)),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              _drawHeader(context, comment),
              BodyWidget(body: comment.body, ellipsize: false),
              _drawEmbed(comment)
            ]))
      ]),
      //onTap: () {},
      //onDoubleTap: () {},
      //onLongPress: () {})
    ];
  }

  Widget _drawEmbed(EntryComment comment) {
    if (comment.embed != null) {
      return Container(
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: EmbedWidget(embed: comment.embed, reducedWidth: 86.0));
    } else {
      return Container();
    }
  }

  Widget _drawHeader(BuildContext context, EntryComment comment) {
    return Padding(
        padding: EdgeInsets.only(left: 12, top: 8, right: 12),
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
                                fontSize: 13.0,
                                color: Utils.getAuthorColor(
                                    comment.author, context))))),
                Text("  •  " + Utils.getSimpleDate(comment.date),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 10.5,
                        color: Theme.of(context).textTheme.caption.color))
              ])),
              VoteButton(
                  isSelected: true, count: comment.voteCount, onClicked: () {})
            ]));
  }
}