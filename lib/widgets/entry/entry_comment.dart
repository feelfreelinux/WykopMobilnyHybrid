import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class EntryCommentWidget extends StatelessWidget {
  EntryCommentWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryCommentModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).backgroundColor,
        child: _buildEntryCommentBody(model, context),
      ),
    );
  }

  void _showActionsDialog(BuildContext context, EntryCommentModel comment) {
    //TODO: this shit
    /*
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

    ActionsDialog.showActionsDialog(context, actions);*/
  }

  Widget _buildEntryCommentBody(EntryCommentModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
            child: AvatarWidget(
                author: model.author, size: 36.0), //TODO: Add badge
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
                        Padding(
                          padding: EdgeInsets.only(
                              left: 12.0, right: 66.0, top: 8.0, bottom: 4.0),
                          child: Text(
                            model.author.login,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Utils.getAuthorColor(
                                  model.author.color, context),
                            ),
                          ),
                        ),
                        SupaGestureDetector(
                          onLongPress: () => _showActionsDialog(context, model),
                          child: BodyWidget(
                            textSize: 15.0,
                            body: model.body,
                            ellipsize: false,
                            padding: EdgeInsets.only(
                                bottom: 8.0, left: 12.0, right: 12.0),
                          ),
                        ),
                        Visibility(
                          visible: model.embed != null,
                          child: EmbedWidget(
                            padding: EdgeInsets.only(
                                top: model.body != null ? 0.0 : 4.0),
                            embed: model.embed,
                            borderRadius: 20.0,
                            reducedWidth: 82.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 2.0,
                    right: 0.0,
                    child: VoteButton(
                      isSelected: model.isVoted,
                      isComment: true,
                      count: model.voteCount,
                      onClicked: () => model.toggleVote(),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  TextButton(
                    isButton: false,
                    padding: EdgeInsets.only(top: 2.0, bottom: 4.0, left: 14.0),
                    text: Utils.getSimpleDate(model.date),
                  ),
                  TextButton(
                    padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                    text: "Cytuj",
                    onTap: () => OwmKeys.inputBarKey.currentState
                        .quoteText(model.body, author: model.author),
                  ),
                  TextButton(
                    padding: EdgeInsets.only(top: 2.0, bottom: 4.0, right: 8.0),
                    text: "Odpowiedz",
                    onTap: () => OwmKeys.inputBarKey.currentState
                        .replyToUser(model.author),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
