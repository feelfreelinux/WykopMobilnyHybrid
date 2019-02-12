import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'dart:async';

class EntryCommentWidget extends StatelessWidget {
  final int commentId;
  EntryCommentWidget({this.commentId});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntryComment>(
        converter: (store) =>
            store.state.entitiesState.entryComments[commentId],
        builder: (context, comment) {
          return Material(
            key: Key(commentId.toString()),
            color: Theme.of(context).cardColor,
            child: _buildEntryCommentBody(comment, context),
          );
        });
  }

  void _showActionsDialog(BuildContext context, EntryComment comment,
      AuthState authState, VoidCallback deleteCommentCallback) {
    var actions = [
      ActionsDialogItem(
          icon: OwmGlyphs.ic_dig_list,
          onTap: () {},
          title: "Lista plusujących"),
      ActionsDialogItem(
          icon: OwmGlyphs.ic_copy_content_light,
          onTap: () {},
          title: "Kopiuj treść")
    ];

    if (comment.author.login != authState.login) {
      actions.add(ActionsDialogItem(
          icon: OwmGlyphs.ic_report, onTap: () {}, title: "Zgłoś"));
    } else {
      actions
        ..add(ActionsDialogItem(
            icon: OwmGlyphs.ic_pen, onTap: () {}, title: "Edytuj komentarz"))
        ..add(ActionsDialogItem(
            icon: OwmGlyphs.ic_delete,
            onTap: deleteCommentCallback,
            title: "Usuń"));
    }

    ActionsDialog.showActionsDialog(context, actions);
  }

  Widget _buildEntryCommentBody(EntryComment comment, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                  bottom: 12.0,
                ),
                child: AvatarWidget(
                  author: comment.author,
                  size: 38.0,
                  genderVisibility: true,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawHeader(context, comment),
                    _drawBody(comment),
                    _drawEmbed(comment),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1,
            indent: 50,
          ),
        ],
      ),
    );
  }

  Widget _drawBody(EntryComment comment) {
    return StoreConnector<AppState, AuthState>(
        converter: (store) => store.state.authState,
        builder: (context, authState) => StoreConnector<AppState, VoidCallback>(
              converter: (store) => () =>
                  store.dispatch(deleteEntryComment(commentId, Completer())),
              builder: (context, deleteCommentCallback) => SupaGestureDetector(
                    onDoubleTap: () {
                      // Quote action
                      OwmKeys.inputBarKey.currentState
                          .quoteText(comment.author, comment.body);
                    },
                    onTap: () {
                      // Reply action
                      OwmKeys.inputBarKey.currentState
                          .replyToUser(comment.author);
                    },
                    onLongPress: () {
                      _showActionsDialog(
                          context, comment, authState, deleteCommentCallback);
                    },
                    child: BodyWidget(
                      body: comment.body,
                      ellipsize: false,
                      padding: EdgeInsets.only(
                        top: 2.0,
                        left: 12.0,
                        right: 2.0,
                        bottom: 12.0,
                      ),
                    ),
                  ),
            ));
  }

  Widget _drawEmbed(EntryComment comment) {
    if (comment.embed != null) {
      return Container(
        padding: EdgeInsets.only(
          left: 12.0,
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

  Widget _drawHeader(BuildContext context, EntryComment comment) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        top: 10.0,
        bottom: 1.5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                        fontSize: 13.5,
                        color: Utils.getAuthorColor(comment.author, context),
                      ),
                    ),
                  ),
                ),
                Text(
                  "  •  " + Utils.getSimpleDate(comment.date),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Theme.of(context).textTheme.caption.color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
            ),
            child: StoreConnector<AppState, VoidCallback>(
              converter: (store) =>
                  () => store.dispatch(voteEntryComment(comment.id)),
              builder: (context, callback) => VoteButton(
                    isSelected: comment.isVoted,
                    count: comment.voteCount,
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
