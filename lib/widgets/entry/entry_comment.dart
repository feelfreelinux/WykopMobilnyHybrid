import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
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
        child: _buildEntryCommentBody(model, context),
      ),
    );
  }

  Widget _drawToolbarIcon(IconData icon, String title, VoidCallback onPressed) {
    return Expanded(
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Icon(
                      icon,
                      size: 28.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEntryCommentBody(EntryCommentModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
            child: GestureDetector(
              onTap: () => _openUserDialog(context, model.author),
              child: AvatarWidget(
                author: model.author,
                size: 36.0,
                badge: Utils.getRelationColor(widget.relation),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  GestureDetector(
                    onLongPress: () => _showActionsDialog(context, model),
                    child: Container(
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
                                left: 12.0,
                                right: 40.0 + _votePadding(model.voteCount),
                                top: 8.0,
                                bottom: 4.0),
                            child: GestureDetector(
                              onTap: () =>
                                  _openUserDialog(context, model.author),
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
                          ),
                          BodyWidget(
                            textSize: 15.0,
                            body: model.body,
                            ellipsize: false,
                            padding: EdgeInsets.only(
                                bottom: 8.0, left: 12.0, right: 12.0),
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
                  ),
                  Positioned(
                    top: 2.0,
                    right: 0.0,
                    child: VoteButton(
                      isSelected: model.isVoted,
                      isComment: true,
                      count: model.voteCount,
                      onClicked: () => model.toggleVote(),
                      onLongClicked: () => showDialog(
                        context: context,
                        builder: (_) => GreatDialogWidget(
                          child: Text(
                              "Niezaimplementowane"), //TODO: implement voters list
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<InputModel>(
                builder: (context, inputModel, _) => Row(
                  children: <Widget>[
                    TextButton(
                      onTap: () => setState(() => showFullDate = !showFullDate),
                      isButton: false,
                      padding:
                          EdgeInsets.only(top: 2.0, bottom: 4.0, left: 14.0),
                      text: showFullDate
                          ? Utils.getDateFormat(
                              model.date, 'dd.MM.yyyy \'o\' HH:mm:ss')
                          : Utils.getSimpleDate(model.date),
                    ),
                    TextButton(
                      padding: EdgeInsets.only(top: 2.0, bottom: 4.0),
                      text: "Cytuj",
                      onTap: () => inputModel.inputBarKey.currentState
                          .quoteText(
                              parse(model.body ?? "").documentElement.text,
                              author: model.author),
                    ),
                    TextButton(
                      padding:
                          EdgeInsets.only(top: 2.0, bottom: 4.0, right: 8.0),
                      text: "Odpowiedz",
                      onTap: () => inputModel.inputBarKey.currentState
                          .replyToUser(model.author),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showActionsDialog(BuildContext contextmain, EntryCommentModel comment) {
    showModalBottomSheet<void>(
      context: contextmain,
      builder: (BuildContext context) => Consumer<AuthStateModel>(
        builder: (context, authStateModel, _) => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: <Widget>[
                  _drawToolbarIcon(
                    Icons.share,
                    "Udostępnij",
                    () {
                      Navigator.pop(context);
                      Share.share("https://www.wykop.pl/wpis/" +
                          widget.entryId.toString() +
                          "/#comment-" +
                          comment.id.toString());
                    },
                  ),
                  Visibility(
                    visible: comment.body != "​​​​​" && comment.body != null,
                    child: _drawToolbarIcon(Icons.content_copy, "Kopiuj treść",
                        () {
                      Navigator.pop(context);
                      Utils.copyToClipboard(contextmain,
                          parse(comment.body ?? "").documentElement.text);
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        widget.relation != AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.report, "Zgłoś", () {
                      Navigator.pop(context); //TODO: implement report comment
                      Scaffold.of(contextmain).showSnackBar(
                          SnackBar(content: Text("Niezaimplementowane")));
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        widget.relation == AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.edit, "Edytuj", () {
                      Navigator.pop(context); //TODO: implement edit comment
                      Scaffold.of(contextmain).showSnackBar(
                          SnackBar(content: Text("Niezaimplementowane")));
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        widget.relation == AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.delete, "Usuń", () {
                      Navigator.pop(context); //TODO: implement delete comment
                      Scaffold.of(contextmain).showSnackBar(
                          SnackBar(content: Text("Niezaimplementowane")));
                    }),
                  ),
                ],
              ),
            ),
          ],
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

  double _votePadding(int i) {
    if (i < 100 && i > 9) return 10.0;
    if (i < 1000 && i > 99) return 20.0;
    if (i > 999) return 30.0;
    return 0.0;
  }
}
