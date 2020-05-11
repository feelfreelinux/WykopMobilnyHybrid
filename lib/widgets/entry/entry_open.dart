import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';
import 'package:html/parser.dart';

class EntryOpenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EntryModel>(
      builder: (context, model, _) => Consumer<InputModel>(
        builder: (context, inputModel, _) => Consumer<AuthStateModel>(
          builder: (context, authStateModel, _) => AuthorRelationBuilder(
            relationType: RelationType.ENTRY,
            builder: (context, relation) => Material(
              key: Key(model.id.toString()),
              color: Theme.of(context).cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _drawVotersList(context, model),
                        VoteButton(
                          fontSize: 17.0,
                          isSelected: model.isVoted,
                          count: model.voteCount,
                          onClicked: () {
                            model.voteToggle();
                          },
                          onLongClicked: () => model.upvoters.length == 0
                              ? null
                              : _showVotersDialog(context, model.upvoters),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onLongPress: () => _showActionsDialog(
                        context, model, authStateModel, relation),
                    child: BodyWidget(
                      textSize: 16,
                      body: model.body,
                      padding: EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 2.0),
                    ),
                  ),
                  Visibility(
                    visible: model.embed != null,
                    child: GestureDetector(
                      onLongPress: () => _showActionsDialog(
                          context, model, authStateModel, relation),
                      child: EmbedWidget(
                        padding: EdgeInsets.fromLTRB(18.0, 12.0, 18.0, 2.0),
                        embed: model.embed,
                        type: ImageType.ENTRY,
                        borderRadius: 18.0,
                        reducedWidth: 36.0,
                      ),
                    ),
                  ),
                  _shadowHeaderWidget(
                    context,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(18.0, 12.0, 12.0, 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            model.commentsCount.toString() +
                                " " +
                                Utils.polishPlural(
                                  count: model.commentsCount,
                                  first: "komentarz",
                                  many: "komentarzy",
                                  other: "komentarze",
                                ),
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 8.0),
                              child: Text(
                                "Cytuj",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            onTap: () => inputModel.inputBarKey.currentState
                                .quoteText(
                                    parse(model.body ?? "")
                                        .documentElement
                                        .text,
                                    author: model.author),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(30),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 3.0, horizontal: 8.0),
                              child: Text(
                                "Odpowiedz",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                            onTap: () => inputModel.inputBarKey.currentState
                                .replyToUser(model.author),
                          ),
                        ],
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

  Widget _shadowHeaderWidget(BuildContext context, {Widget child}) {
    return Stack(
      children: <Widget>[
        Container(
          height: 20.0,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 19.0),
          foregroundDecoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6.0,
                spreadRadius: -2.0,
                offset: Offset(0.0, -6.0),
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Material(type: MaterialType.transparency, child: child),
        ),
      ],
    );
  }

  Widget _drawVotersList(BuildContext context, EntryModel model) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showVotersDialog(context, model.upvoters),
        child: Stack(
          children: <Widget>[
            Visibility(
              visible: model.upvoters.length == 0,
              child: Container(
                height: 34.5,
                alignment: Alignment.centerLeft,
                child: Text("Jeszcze nikt nie dał plusa"),
              ),
            ),
            ...List<int>.generate(
                    model.upvoters.length >= 6 ? 6 : model.upvoters.length,
                    (i) => i)
                .map(
                  (e) => e == 0
                      ? AvatarWidget(
                          author: model.upvoters[e].author,
                          size: 30.0,
                          genderVisibility: false,
                        )
                      : Positioned(
                          left: 26.0 * e.toDouble(),
                          child: AvatarWidget(
                            author: model.upvoters[e].author,
                            size: 30.0,
                            genderVisibility: false,
                          ),
                        ),
                )
                .toList(),
            Visibility(
              visible: model.upvoters.length > 6,
              child: Positioned(
                left: 156.0,
                child: GestureDetector(
                  child: Container(
                    height: 34.5,
                    width: 34.5,
                    decoration: BoxDecoration(
                      color: Utils.backgroundGrey(context),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).backgroundColor,
                        width: 2.0,
                      ),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      size: 21.0,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showActionsDialog(BuildContext contextmain, EntryModel model,
      AuthStateModel authStateModel, AuthorRelation relation) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          EntryToolbarWidget(contextmain, model, authStateModel, relation),
    );
  }

  void _showVotersDialog(BuildContext context, List<Voter> voters) {
    showDialog(
      context: context,
      builder: (context) => EntryVotersWidget(voters),
    );
  }
}
