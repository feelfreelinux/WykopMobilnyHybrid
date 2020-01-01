import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/screens/input.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart';

class LinkCommentWidget extends StatefulWidget {
  final AuthorRelation relation;
  final int linkId;

  LinkCommentWidget({@required this.relation, @required this.linkId});

  _LinkCommentWidgetState createState() => _LinkCommentWidgetState();
}

class _LinkCommentWidgetState extends State<LinkCommentWidget> {
  bool showFullDate = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkCommentModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).backgroundColor,
        child: !model.isExpanded
            ? ContentHiddenWidget(onTap: () => model.expand())
            : _buildLinkCommentBody(model, context),
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
                    child: Icon(icon, size: 28.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
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

  Widget _buildLinkCommentBody(LinkCommentModel model, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: model.isParentComment ? 14.0 : 44.0, right: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 6.0, bottom: 12.0),
            child: GestureDetector(
              onTap: () => _openUserDialog(context, model.author),
              child: AvatarWidget(
                author: model.author,
                size: model.isParentComment ? 36.0 : 28.0,
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
                          Size(
                              MediaQuery.of(context).size.width -
                                  (model.isParentComment ? 82.0 : 104.0),
                              double.infinity),
                        ),
                        decoration: BoxDecoration(
                          color: Utils.backgroundGrey(context),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin:
                            EdgeInsets.only(left: 8.0, top: 6.0, right: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.0,
                                right: 80.0 +
                                    (Provider.of<OWMSettings>(context)
                                            .splitVotesLink
                                        ? 10 +
                                            _votePadding(model.voteCountPlus) +
                                            _votePadding(-(model.voteCount -
                                                model.voteCountPlus))
                                        : 8 + _votePadding(model.voteCount)),
                                top: 8.0,
                                bottom: 4.0,
                              ),
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
                                type: ImageType.COMMENT,
                                borderRadius: 20.0,
                                reducedWidth:
                                    model.isParentComment ? 82.0 : 104.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2.0,
                      right: 0.0,
                      child: _drawVoteButons(model),
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
                            EdgeInsets.only(top: 2.0, bottom: 4.0, left: 14.0),
                        text: showFullDate
                            ? Utils.getDateFormat(
                                model.date, 'dd.MM.yyyy \'o\' HH:mm:ss')
                            : Utils.getSimpleDate(model.date),
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
                          onTap: () =>
                              Provider.of<LinkModel>(context, listen: false)
                                  .replyTo(
                            model.author,
                            model.parentId,
                          ),
                          text: "Odpowiedz",
                        ),
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

  void _showActionsDialog(BuildContext contextmain, LinkCommentModel comment) {
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
                  _drawToolbarIcon(Icons.share, "Udostępnij", () {
                    Navigator.pop(context);
                    Share.share(
                        "https://www.wykop.pl/link/${widget.linkId}/comment/${comment.id}#comment-${comment.id}");
                  }),
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
                      Navigator.pop(context);
                      Utils.launchURL(comment.violationUrl, context);
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        widget.relation == AuthorRelation.User,
                    child: _drawToolbarIcon(
                      Icons.edit,
                      "Edytuj",
                      () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          Utils.getPageTransition(
                            EditInputScreen(
                              id: comment.id,
                              inputData: InputData(body: comment.body),
                              inputType: InputType.LINK_COMMENT,
                              linkCommentEdited: (editedComment) =>
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
                    child: _drawToolbarIcon(Icons.delete, "Usuń", () async {
                      Navigator.pop(context);
                      if (await showConfirmDialog(
                        context,
                        "Jesteś tego pewien?",
                      )) {
                        comment.delete();
                      }
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

  Widget _drawVoteButons(LinkCommentModel model) {
    return Provider.of<OWMSettings>(context).splitVotesLink
        ? Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: VoteButton(
                  count: model.voteCountPlus,
                  isSelected: model.voteState == LinkCommentVoteState.UP_VOTED,
                  isComment: true,
                  onClicked: () => model.voteUp(),
                ),
              ),
              VoteButton(
                count: -(model.voteCount - model.voteCountPlus),
                negativeIcon: true,
                isSelected: model.voteState == LinkCommentVoteState.DOWN_VOTED,
                isComment: true,
                onClicked: () => model.voteDown(),
              ),
            ],
          )
        : Row(
            children: <Widget>[
              VoteButton(
                isSelected: model.voteState == LinkCommentVoteState.UP_VOTED,
                isComment: true,
                onlyIcon: true,
                onClicked: () => model.voteUp(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                padding: EdgeInsets.all(15 / 3.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  color: Utils.voteBackgroundStateColor(
                    context,
                    isComment: true,
                    isSelected: false,
                    negativeIcon: false,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15 / 3.5),
                  child: Text(
                    (model.voteCount > 0 ? "+" : "") +
                        (model.voteCount).toString(),
                    style: TextStyle(
                      color: model.voteCount < 0
                          ? Colors.red[700]
                          : model.voteCount > 0
                              ? Colors.green[700]
                              : Theme.of(context).textTheme.body1.color,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              VoteButton(
                negativeIcon: true,
                isSelected: model.voteState == LinkCommentVoteState.DOWN_VOTED,
                isComment: true,
                onlyIcon: true,
                onClicked: () => model.voteDown(),
              ),
            ],
          );
  }

  void _openUserDialog(BuildContext context, Author author) {
    showDialog(
      context: context,
      builder: (_) => UserDialogWidget(author: author),
    );
  }

  double _votePadding(int i) {
    if (i < 0 && i > -10) return 4.0;
    if (i <= -10 && i > -100) return 14.0;
    if (i <= -100 && i > -1000) return 24.0;
    if (i <= -1000) return 34.0;
    if (i < 100 && i > 9) return 10.0;
    if (i < 1000 && i > 99) return 20.0;
    if (i > 999) return 30.0;
    return 0.0;
  }
}
