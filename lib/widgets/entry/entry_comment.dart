import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/screens/input.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/entry/entry_toolbar_button.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart';

class EntryCommentWidget extends StatefulWidget {
  final int entryId;
  final AuthorRelation relation;

  EntryCommentWidget({@required this.entryId, @required this.relation});

  _EntryCommentWidgetState createState() => _EntryCommentWidgetState();
}

class _EntryCommentWidgetState extends State<EntryCommentWidget> {
  bool showFullDate = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryCommentModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).backgroundColor,
        child: !model.isExpanded
            ? ContentHiddenWidget(onTap: () => model.expand())
            : _buildEntryCommentBody(model, context),
      ),
    );
  }

  Widget _buildEntryCommentBody(EntryCommentModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 25.0, bottom: 12.0),
            child: GestureDetector(
              onTap: () => _openUserDialog(context, model.author),
              child: AvatarWidget(
                author: model.author,
                size: 34.0,
                badge: Utils.getRelationColor(widget.relation),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    GestureDetector(
                      onLongPress: () => _showActionsDialog(context, model),
                      child: Container(
                        constraints: BoxConstraints.loose(
                          Size(MediaQuery.of(context).size.width - 78.0,
                              double.infinity),
                        ),
                        margin:
                            EdgeInsets.only(left: 8.0, top: 0.0, right: 2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0,
                                  right: 30.0 + _votePadding(model.voteCount),
                                  top: 6.0,
                                  bottom: 4.0),
                              child: GestureDetector(
                                onTap: () =>
                                    _openUserDialog(context, model.author),
                                child: Text(
                                  model.author.login,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Utils.getAuthorColor(
                                        model.author.color, context),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Utils.backgroundGrey(context),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BodyWidget(
                                    textSize: 16.0,
                                    body: model.body,
                                    ellipsize: false,
                                    padding: EdgeInsets.fromLTRB(12, 9, 12, 9),
                                  ),
                                  Visibility(
                                    visible: model.embed != null,
                                    child: EmbedWidget(
                                      embed: model.embed,
                                      type: ImageType.COMMENT,
                                      borderRadius: 18.0,
                                      reducedWidth: 78.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5.0,
                      right: 0.0,
                      child: VoteButton(
                        isSelected: model.isVoted,
                        isComment: true,
                        count: model.voteCount,
                        onlyIcon: model.voteCount == 0 ? true : false,
                        onClicked: () => model.toggleVote(),
                        onLongClicked: () async {
                          await model.loadUpVoters();
                          if (model.upvoters.length != 0)
                            _showVotersDialog(context, model);
                        },
                      ),
                    ),
                  ],
                ),
                Consumer<InputModel>(
                  builder: (context, inputModel, _) => Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextButton(
                        onTap: () =>
                            setState(() => showFullDate = !showFullDate),
                        isButton: false,
                        padding:
                            EdgeInsets.only(top: 2.0, bottom: 4.0, left: 12.0),
                        text: showFullDate
                            ? Utils.getDateFormat(
                                model.date, 'HH:mm:ss • dd.MM.yyyy')
                            : Utils.getSimpleDate(model.date,
                                    locale: "en_short")
                                .replaceAll("now", "teraz")
                                .replaceAll("h", "g")
                                .replaceAll("mo", "mie")
                                .replaceAll("~1 yr", "~1 r")
                                .replaceAll("yr", "l")
                                .replaceAll("~", ""),
                      ),
                      Flexible(
                        child: TextButton(
                          padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                          onTap: () => inputModel.inputBarKey.currentState
                              .quoteText(
                                  parse(model.body ?? "").documentElement.text,
                                  author: model.author),
                          text: "Cytuj",
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                          onTap: () => inputModel.inputBarKey.currentState
                              .replyToUser(model.author),
                          text: "Odpowiedz",
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showActionsDialog(BuildContext contextmain, EntryCommentModel comment) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) => Consumer<AuthStateModel>(
        builder: (context, authStateModel, _) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black38)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  margin: EdgeInsets.only(top: 16.0),
                  height: 4.0,
                  width: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
              ),
              Visibility(
                visible: comment.app != null,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 0.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: comment.author.login,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.body1.color,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: " via ",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: (comment.app ?? ""),
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 6.0, right: 6.0, bottom: 10.0, top: 4.0),
                child: Row(
                  children: <Widget>[
                    EntryToolbarButtonWidget(
                      CommunityMaterialIcons.share_variant,
                      "Udostępnij",
                      () {
                        Navigator.pop(context);
                        Share.share(
                            "https://www.wykop.pl/wpis/${widget.entryId}/#comment-${comment.id}");
                      },
                    ),
                    Visibility(
                      visible: comment.body != "​​​​​" && comment.body != null,
                      child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.content_copy,
                        "Kopiuj treść",
                        () {
                          Navigator.pop(context);
                          Utils.copyToClipboard(contextmain,
                              parse(comment.body ?? "").documentElement.text);
                        },
                      ),
                    ),
                    Visibility(
                      visible:
                          !(comment.body != "​​​​​" && comment.body != null),
                      child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.file_image,
                        "Zapisz",
                        () async {
                          Navigator.pop(context);
                          await ImageDownloader.downloadImage(
                              comment.embed.url);
                          Scaffold.of(contextmain).showSnackBar(SnackBar(
                              content: Text("Obrazek został zapisany")));
                        },
                      ),
                    ),
                    Visibility(
                      visible: authStateModel.loggedIn &&
                          widget.relation != AuthorRelation.User,
                      child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.alert_octagon_outline,
                        "Zgłoś",
                        () {
                          Navigator.pop(context);
                          Utils.launchURL(comment.violationUrl, context);
                        },
                      ),
                    ),
                    Visibility(
                      visible: authStateModel.loggedIn &&
                          widget.relation == AuthorRelation.User,
                      child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.square_edit_outline,
                        "Edytuj",
                        () {
                          Navigator.pop(context); //TODO: implement edit comment
                          Navigator.of(context).push(
                            Utils.getPageTransition(
                              EditInputScreen(
                                id: comment.id,
                                inputData: InputData(body: comment.body),
                                inputType: InputType.ENTRY_COMMENT,
                                commentEdited: (editedComment) =>
                                    comment.setData(editedComment),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: authStateModel.loggedIn &&
                          widget.relation == AuthorRelation.User,
                      child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.trash_can_outline,
                        "Usuń",
                        () async {
                          Navigator.pop(context);
                          if (await showConfirmDialog(
                              context, "Usunąć ten komentarz?")) {
                            comment.delete();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openUserDialog(BuildContext context, Author author) {
    showDialog(
      context: context,
      builder: (_) => UserDialogWidget(author: author),
    );
  }

  void _showVotersDialog(BuildContext context, EntryCommentModel voters) {
    showDialog(
      context: context,
      builder: (context) => EntryVotersWidget(voters.upvoters),
    );
  }

  double _votePadding(int i) {
    if (i < 10 && i > 0) return 15.0;
    if (i < 100 && i > 9) return 25.0;
    if (i < 1000 && i > 99) return 30.0;
    if (i > 999) return 40.0;
    return 0.0;
  }
}
