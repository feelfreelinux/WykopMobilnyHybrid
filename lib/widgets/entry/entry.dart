import 'package:flutter/material.dart';
import 'package:owmflutter/models/input_data.dart';
import 'package:owmflutter/widgets/content_hidden.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:owmflutter/model/model.dart';
import 'package:share/share.dart';
import 'package:html/parser.dart';

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
              : Column(
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
                        ),
                      ],
                    ),
                    AuthorRelationBuilder(
                      relationType: RelationType.ENTRY,
                      builder: (context, relation) => GestureDetector(
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
                              Provider.of<OWMSettings>(context).shortLongBody,
                          textSize: 16.0,
                          padding: EdgeInsets.only(
                              top: 8.0, left: 2.0, right: 2.0, bottom: 2.0),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: model.embed != null,
                      child: EmbedWidget(
                        padding: EdgeInsets.only(top: 12.0, bottom: 2.0),
                        embed: model.embed,
                        type: ImageType.ENTRY,
                        borderRadius: 20.0,
                        reducedWidth: 36.0,
                        isNsfwTag: model.isNsfw,
                      ),
                    ),
                    EntryFooterWidget(model, isClickable),
                    DividerWidget(),
                  ],
                ),
        ),
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

  void _showActionsDialog(
      BuildContext contextmain, EntryModel entry, AuthorRelation relation) {
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
                      Share.share("https://www.wykop.pl/wpis/${entry.id}");
                    },
                  ),
                  _drawToolbarIcon(Icons.content_copy, "Kopiuj treść", () {
                    Navigator.pop(context);
                    Utils.copyToClipboard(contextmain,
                        parse(entry.body ?? "").documentElement.text);
                  }),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation != AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.report, "Zgłoś", () {
                      Navigator.pop(context); //TODO: implement report comment
                      Utils.launchURL('https://a.wykop.pl/naruszenia/form/ot/entry/od/${entry.id}', context);
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation == AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.edit, "Edytuj", () {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        Utils.getPageTransition(
                          EditInputScreen(
                            id: entry.id,
                            inputData: InputData(body: entry.body),
                            inputType: InputType.ENTRY,
                            entryEdited: (editedEntry) => entry.setData(editedEntry),
                          ),
                        ),
                      );
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation == AuthorRelation.User,
                    child: _drawToolbarIcon(Icons.delete, "Usuń", () async {
                      Navigator.pop(context);
                      if (await showConfirmDialog(
                        context,
                        "Jesteś tego pewien?",
                      )) {
                        entry.delete();
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
}
