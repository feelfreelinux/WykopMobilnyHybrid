import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class EntryCommentWidget extends StatefulWidget {
  final int entryId;
  final AuthorRelation relation;

  EntryCommentWidget({@required this.entryId, @required this.relation});

  _EntryCommentWidgetState createState() => _EntryCommentWidgetState();
}

class _EntryCommentWidgetState extends State<EntryCommentWidget> {
  bool showFullDate = false;
  bool showButtonsState = false;

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
    return Consumer<InputModel>(
      builder: (context, inputModel, _) => _dismissibleWidget(
        model: model,
        inputModel: inputModel,
        child: Padding(
          padding: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 4.0),
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
                        Consumer<AuthStateModel>(
                          builder: (context, authStateModel, _) =>
                              GestureDetector(
                            onLongPress: () {
                              setState(
                                  () => showButtonsState = !showButtonsState);
                              _showActionsDialog(
                                  context, model, inputModel, authStateModel);
                            },
                            child: Container(
                              constraints: BoxConstraints.loose(
                                Size(MediaQuery.of(context).size.width - 78.0,
                                    double.infinity),
                              ),
                              margin: EdgeInsets.fromLTRB(8.0, 0.0, 2.0, 6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.0,
                                        right: 30.0 +
                                            _votePadding(model.voteCount),
                                        top: 6.0,
                                        bottom: 4.0),
                                    child: GestureDetector(
                                      onTap: () => _openUserDialog(
                                          context, model.author),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                              model.author.login,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Utils.getAuthorColor(
                                                    model.author.color,
                                                    context),
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onTap: () => setState(() =>
                                                showFullDate = !showFullDate),
                                            isButton: false,
                                            textSize: 14.0,
                                            text: " • " +
                                                (showFullDate
                                                    ? Utils.getDateFormat(
                                                        model.date,
                                                        'HH:mm:ss • dd.MM.yyyy')
                                                    : Utils.getSimpleDate(
                                                            model.date,
                                                            locale: "en_short")
                                                        .replaceAll(
                                                            "now", "teraz")
                                                        .replaceAll("h", "g")
                                                        .replaceAll("mo", "mie")
                                                        .replaceAll(
                                                            "~1 yr", "~1 r")
                                                        .replaceAll("yr", "l")
                                                        .replaceAll("~", "")),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    decoration: BoxDecoration(
                                      color: showButtonsState
                                          ? Colors.grey.withOpacity(0.5)
                                          : Utils.backgroundGrey(context),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        BodyWidget(
                                          textSize: 16.0,
                                          body: model.body,
                                          ellipsize: false,
                                          padding: EdgeInsets.fromLTRB(
                                              12.0, 9.0, 12.0, 9.0),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dismissibleWidget({
    EntryCommentModel model,
    InputModel inputModel,
    Widget child,
  }) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) => authStateModel.loggedIn
          ? Dismissible(
              direction: DismissDirection.startToEnd,
              background: Align(
                alignment: Alignment.centerLeft,
                child: RoundIconButtonWidget(
                  icon: CommunityMaterialIcons.reply,
                  iconPadding: EdgeInsets.fromLTRB(6, 4, 6, 8),
                  padding: EdgeInsets.fromLTRB(12, 18, 0, 0),
                ),
              ),
              confirmDismiss: (direction) async {
                inputModel.inputBarKey.currentState.replyToUser(model.author);
                Vibration.vibrate(duration: 25);
                return;
              },
              dismissThresholds: {DismissDirection.startToEnd: 0.3},
              key: Key(model.id.toString()),
              child: child,
            )
          : child,
    );
  }

  void _showActionsDialog(
    BuildContext contextmain,
    EntryCommentModel model,
    InputModel inputModel,
    AuthStateModel authStateModel,
  ) {
    Future<void> future = showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) => EntryCommentToolbarWidget(
        contextmain,
        model,
        inputModel,
        authStateModel,
        widget,
      ),
    );
    future.then(
        (void value) => setState(() => showButtonsState = !showButtonsState));
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
