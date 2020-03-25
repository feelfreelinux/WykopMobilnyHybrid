import 'package:flutter/material.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/entry/entry_bottomsheet.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';

class NewEntryWidget extends StatelessWidget {
  final bool ellipsize;
  final bool isClickable;

  NewEntryWidget({this.ellipsize, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return Consumer<EntryModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: !model.isExpanded
              ? ContentHiddenWidget(
                  onTap: () => model.expand(),
                )
              : AuthorRelationBuilder(
                  relationType: RelationType.ENTRY,
                  builder: (context, relation) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: AuthorWidget(
                              author: model.author,
                              date: model.date,
                              fontSize: 15.0,
                              padding: EdgeInsets.only(top: 12.0, right: 4.0),
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
                      GestureDetector(
                        onLongPress: () =>
                            _showActionsDialog(context, model, relation),
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
                          padding: EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 2.0),
                        ),
                      ),
                      Visibility(
                        visible: model.embed != null,
                        child: GestureDetector(
                          onLongPress: () =>
                              _showActionsDialog(context, model, relation),
                          child: EmbedWidget(
                            padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
                            embed: model.embed,
                            type: ImageType.ENTRY,
                            borderRadius: 18.0,
                            reducedWidth: 36.0,
                            isNsfwTag: model.isNsfw,
                          ),
                        ),
                      ),
                      EntryFooterWidget(model, isClickable, relation),
                      DividerWidget(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void _showActionsDialog(
      BuildContext contextmain, EntryModel entry, AuthorRelation relation) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          EntryBottomsheetWidget(contextmain, entry, relation),
    );
  }

  void _showVotersDialog(BuildContext context, EntryModel voters) {
    showDialog(
      context: context,
      builder: (context) => EntryVotersWidget(voters.upvoters),
    );
  }
}
