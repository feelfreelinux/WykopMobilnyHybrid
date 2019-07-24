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
      converter: (store) => store.state.entitiesState.entryComments[commentId],
      builder: (context, comment) {
        return Material(
          key: Key(commentId.toString()),
          color: Theme.of(context).backgroundColor,
          child: _buildEntryCommentBody(comment, context),
        );
      },
    );
  }

  void _showActionsDialog(BuildContext context, EntryComment comment,
      AuthState authState, VoidCallback deleteCommentCallback) {
    var actions = [
      ActionsDialogItem(
        icon: OwmGlyphs.ic_dig_list,
        onTap: () {},
        title: "Lista plusujących",
      ),
      ActionsDialogItem(
        icon: OwmGlyphs.ic_copy_content_light,
        onTap: () {},
        title: "Kopiuj treść",
      ),
    ];

    if (comment.author.login != authState.login) {
      actions.add(ActionsDialogItem(
        icon: OwmGlyphs.ic_report,
        onTap: () {},
        title: "Zgłoś",
      ));
    } else {
      actions
        ..add(ActionsDialogItem(
          icon: OwmGlyphs.ic_pen,
          onTap: () {},
          title: "Edytuj komentarz",
        ))
        ..add(ActionsDialogItem(
          icon: OwmGlyphs.ic_delete,
          onTap: deleteCommentCallback,
          title: "Usuń",
        ));
    }

    ActionsDialog.showActionsDialog(context, actions);
  }

  Widget _buildEntryCommentBody(EntryComment comment, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
            child: AvatarWidget(
              author: comment.author,
              size: 36.0,
              //TODO: Add badge
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width - 82.0,
                          double.infinity),
                    ),
                    decoration: BoxDecoration(
                      color: Utils.backgroundGrey(context),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.only(left: 8.0, top: 6.0, right: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _drawHeader(context, comment),
                        _drawBody(comment),
                        _drawEmbed(comment),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 2.0,
                    right: 0.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: StoreConnector<AppState, VoidCallback>(
                        converter: (store) =>
                            () => store.dispatch(voteEntryComment(comment.id)),
                        builder: (context, callback) => VoteButton(
                          isSelected: comment.isVoted,
                          isComment: true,
                          count: comment.voteCount,
                          onClicked: () {
                            callback();
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  _footerText(
                    context,
                    padding: EdgeInsets.only(
                      top: 2.0,
                      bottom: 4.0,
                      left: 14.0,
                    ),
                    text: Utils.getSimpleDate(comment.date),
                  ),
                  _footerText(
                    context,
                    padding: EdgeInsets.only(
                      top: 2.0,
                      bottom: 4.0,
                    ),
                    text: "Cytuj",
                    isButton: true,
                    onTap: () {
                      OwmKeys.inputBarKey.currentState
                          .quoteText(comment.author, comment.body);
                    },
                  ),
                  _footerText(
                    context,
                    padding: EdgeInsets.only(
                      top: 2.0,
                      bottom: 4.0,
                      right: 8.0,
                    ),
                    text: "Odpowiedz",
                    isButton: true,
                    onTap: () {
                      OwmKeys.inputBarKey.currentState
                          .replyToUser(comment.author);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawHeader(BuildContext context, EntryComment comment) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 66.0,
        top: 8.0,
        bottom: 4.0,
      ),
      child: Text(
        comment.author.login,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.5,
          color: Utils.getAuthorColor(comment.author, context),
        ),
      ),
    );
  }

  Widget _drawBody(EntryComment comment) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (context, authState) => StoreConnector<AppState, VoidCallback>(
        converter: (store) =>
            () => store.dispatch(deleteEntryComment(commentId, Completer())),
        builder: (context, deleteCommentCallback) => SupaGestureDetector(
          onLongPress: () {
            _showActionsDialog(
                context, comment, authState, deleteCommentCallback);
          },
          child: BodyWidget(
            body: comment.body,
            ellipsize: false,
            padding: EdgeInsets.only(
              bottom: 8.0,
              left: 12.0,
              right: 12.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawEmbed(EntryComment comment) {
    return Visibility(
      visible: comment.embed != null,
      child: Padding(
        padding: EdgeInsets.only(top: comment.body != null ? 0.0 : 4.0),
        child: EmbedWidget(
          embed: comment.embed,
          borderRadius: 20.0,
          reducedWidth: 82.0,
        ),
      ),
    );
  }

  Widget _footerText(
    BuildContext context, {
    String text,
    EdgeInsets padding,
    bool isButton: false,
    VoidCallback onTap,
  }) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.0,
              color: Theme.of(context).textTheme.caption.color,
              fontWeight: isButton ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
