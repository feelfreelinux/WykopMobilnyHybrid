import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/keys.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class LinkCommentWidget extends StatelessWidget {
  LinkCommentWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkCommentModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).backgroundColor,
        child: _buildLinkCommentBody(model, context),
      ),
    );
  }

  void _showActionsDialog(BuildContext context, LinkCommentModel comment) {
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

  Widget _buildLinkCommentBody(LinkCommentModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: model.isParentComment ? 14.0 : 44.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
            child: AvatarWidget(
              author: model.author,
              size: 36.0,
              //TODO: Add badge
            ),
          ),
          Expanded(
            child: Column(
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
                          _drawHeader(context, model.author),
                          _drawBody(context, model),
                          _drawEmbed(model.embed, model.body),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 2.0,
                      right: 0.0,
                      child: VoteButton(
                        margin: EdgeInsets.only(left: 8.0),
                        isSelected:
                            model.voteState == LinkCommentVoteState.UP_VOTED,
                        isComment: true,
                        count: model.voteCount,
                        onClicked: () => model.toggleVote(),
                      ),
                    ),
                  ],
                ),
                Consumer<InputModel>(
                  builder: (context, inputModel, _) => Row(
                    children: <Widget>[
                      _footerText(
                        context,
                        padding: EdgeInsets.only(
                          top: 2.0,
                          bottom: 4.0,
                          left: 14.0,
                        ),
                        text: Utils.getSimpleDate(model.date),
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
                          inputModel.inputBarKey.currentState
                              .quoteText(model.body, author: model.author);
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
                          inputModel.inputBarKey.currentState
                              .replyToUser(model.author);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawHeader(BuildContext context, Author author) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        right: 66.0,
        top: 8.0,
        bottom: 4.0,
      ),
      child: Text(
        author.login,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.5,
          color: Utils.getAuthorColor(author.color, context),
        ),
      ),
    );
  }

  Widget _drawBody(BuildContext context, LinkCommentModel model) {
    return BodyWidget(
        textSize: 15.0,
        body: model.body,
        ellipsize: false,
        padding: EdgeInsets.only(bottom: 8.0, left: 12.0, right: 12.0));
  }

  Widget _drawEmbed(Embed embed, String body) {
    return Visibility(
      visible: embed != null,
      child: Padding(
        padding: EdgeInsets.only(top: body != null ? 0.0 : 4.0),
        child: EmbedWidget(
          embed: embed,
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
