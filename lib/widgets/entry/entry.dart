import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';

class EntryWidget extends StatelessWidget {
  final bool ellipsize;
  final bool isClickable;

  EntryWidget({this.ellipsize, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryModel>(
      builder: (context, model, _) => Consumer<AuthStateModel>(
        builder: (context, authStateModel, _) => !model.isExpanded
            ? ContentHiddenWidget(onTap: () => model.expand())
            : Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.0,
                      offset: Offset(0.0, 1.0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).backgroundColor,
                  border: Border.all(
                      color: Theme.of(context).dialogBackgroundColor),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Material(
                  key: Key(model.id.toString()),
                  type: MaterialType.transparency,
                  color: Theme.of(context).cardColor,
                  child: AuthorRelationBuilder(
                    relationType: RelationType.ENTRY,
                    builder: (context, relation) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 12.0, right: 14.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: AuthorWidget(
                                  author: model.author,
                                  date: model.date,
                                  fontSize: 15.0,
                                  padding:
                                      EdgeInsets.only(top: 12.0, right: 4.0),
                                ),
                              ),
                              VoteButton(
                                margin: EdgeInsets.only(top: 10.0),
                                fontSize: 17.0,
                                isSelected: model.isVoted,
                                count: model.voteCount,
                                onClicked: () => model.voteToggle(),
                                onLongClicked: () async {
                                  await model.loadUpVoters();
                                  if (model.upvoters.length != 0)
                                    _showVotersDialog(context, model);
                                },
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onLongPress: () => _showActionsDialog(
                              context, model, authStateModel, relation),
                          onTap: isClickable
                              ? () => Navigator.of(context).push(
                                  Utils.getPageSlideToUp(
                                      EntryScreen(model: model)))
                              : null,
                          child: BodyWidget(
                            body: model.body,
                            ellipsize:
                                Provider.of<OWMSettings>(context, listen: false)
                                    .shortLongBody,
                            textSize: 16.0,
                            padding: EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 2.0),
                          ),
                        ),
                        Visibility(
                          visible: model.embed != null,
                          child: GestureDetector(
                            onLongPress: () => _showActionsDialog(
                                context, model, authStateModel, relation),
                            child: EmbedWidget(
                              padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
                              embed: model.embed,
                              type: ImageType.ENTRY,
                              borderRadius: 18.0,
                              reducedWidth: 30.0,
                              isNsfwTag: model.isNsfw,
                            ),
                          ),
                        ),
                        EntryFooterWidget(
                          model: model,
                          isClickable: isClickable,
                          relation: relation,
                          authStateModel: authStateModel,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
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

  void _showVotersDialog(BuildContext context, EntryModel voters) {
    showDialog(
      context: context,
      builder: (context) => EntryVotersWidget(voters.upvoters),
    );
  }
}
