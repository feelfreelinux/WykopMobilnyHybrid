import 'package:flutter/material.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'dart:async';

class EntryCommentWidget extends StatefulWidget {
  final int commentId;
  EntryCommentWidget({this.commentId});
  _EntryCommentWidgetState createState() => _EntryCommentWidgetState();
}

class _EntryCommentWidgetState extends State<EntryCommentWidget> {
  bool childDetectorActivated = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, EntryComment>(
        converter: (store) =>
            store.state.entitiesState.entryComments[widget.commentId],
        builder: (context, comment) {
          return StoreConnector<AppState, AuthState>(
            converter: (store) => store.state.authState,
            builder: (context, authState) => Material(
                  key: Key(widget.commentId.toString()),
                  color: Theme.of(context).cardColor,
                  child: StoreConnector<AppState, VoidCallback>(
                    converter: (store) => () => store.dispatch(
                        deleteEntryComment(widget.commentId, Completer())),
                    builder: (context, deleteCommentCallback) =>
                        SupaGestureDetector(
                          onDoubleTap: childDetectorActivated
                              ? null
                              : () {
                                  // Quote action
                                  OwmKeys.inputBarKey.currentState
                                      .quoteText(comment.author, comment.body);
                                },
                          onTap: childDetectorActivated
                              ? null
                              : () {
                                  // Reply action
                                  OwmKeys.inputBarKey.currentState
                                      .replyToUser(comment.author);
                                },
                          onLongPress: childDetectorActivated
                              ? null
                              : () {
                                  _showActionsDialog(context, comment,
                                      authState, deleteCommentCallback);
                                },
                          child: _EntryCommentBody((activated) {
                            setState(() {
                              this.childDetectorActivated = activated;
                            });
                          }, comment),
                        ),
                  ),
                ),
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
}

class _EntryCommentBody extends StatelessWidget {
  final EntryComment comment;
  final dynamic activateCallback;
  const _EntryCommentBody(
    this.activateCallback,
    this.comment, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
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
    if (comment.body != null) {
      return BodyWidget(
        body: comment.body,
        ellipsize: false,
        onTapDown: () => this.activateCallback(true),
        onTapUp: () => this.activateCallback(false),
        padding: EdgeInsets.only(
          top: 2.0,
          left: 12.0,
          right: 2.0,
          bottom: 12.0,
        ),
      );
    } else {
      return Container();
    }
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
          onTapDown: () => this.activateCallback(true),
          onTapUp: () => this.activateCallback(false),
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

class SupaGestureDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;
  final VoidCallback onLongPress;

  SupaGestureDetector(
      {@required this.child, this.onDoubleTap, this.onTap, this.onLongPress});
  _SupaGestureDetectorState createState() => _SupaGestureDetectorState();
}

class _SupaGestureDetectorState extends State<SupaGestureDetector> {
  static const int tapSlop = 16;
  static const int longPressTrigger = 500;
  static const int doubleTapInterval = 200;

  Duration lastDownClickTimestamp;
  Duration lastTapTimestamp;

  Offset lastDownPosition;

  Timer tapTimer;
  Timer longPressTimer;

  // Used to detect between taps and scrolls
  bool excededTouchSlop(Offset position) =>
      position.dy < lastDownPosition.dy + tapSlop &&
      position.dy > lastDownPosition.dy - tapSlop;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (p) {
        if (excededTouchSlop(p.position)) {
          // Trigger double tap only if lastest tap happened in lastest doubleTapInterval
          if (lastTapTimestamp != null &&
              p.timeStamp.inMilliseconds <
                  lastTapTimestamp.inMilliseconds + doubleTapInterval) {
            if (tapTimer != null) {
              setState(() {
                tapTimer.cancel();
                tapTimer = null;
                widget.onDoubleTap();
              });
            }
          }
          setState(() {
            lastTapTimestamp = p.timeStamp;
            // Wait a doubleTapInterval to be able to detect a double tap
            this.tapTimer =
                new Timer(const Duration(milliseconds: doubleTapInterval), () {
              widget.onTap();
            });
            this.longPressTimer.cancel();
          });
        }
      },
      onPointerDown: (p) {
        setState(() {
          // Save initial positions, used to detect if finger moved during tap / longpress
          this.lastDownClickTimestamp = p.timeStamp;
          this.lastDownPosition = p.position;

          // Start the long press timer. Can get cancelled by move and tap events
          this.longPressTimer =
              new Timer(const Duration(milliseconds: longPressTrigger), () {
            setState(() {
              this.longPressTimer = null;
            });
            widget.onLongPress();
          });
        });
      },
      onPointerCancel: (_) {},
      onPointerMove: (p) {
        // Cancel long press timer when scroll is detected
        if (this.longPressTimer != null && !excededTouchSlop(p.position)) {
          setState(() {
            this.longPressTimer.cancel();
            this.longPressTimer = null;
          });
        }
      },
      child: widget.child,
    );
  }
}
