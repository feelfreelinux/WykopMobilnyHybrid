import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/entry/entry_toolbar_button.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart';

class EntryBottomsheetWidget extends StatelessWidget {
  final BuildContext contextmain;
  final EntryModel entry;
  final AuthorRelation relation;

  EntryBottomsheetWidget(this.contextmain, this.entry, this.relation);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateModel>(
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
              visible: entry.app != null,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(10.0, 16.0, 10.0, 0.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RichText(
                  text: TextSpan(
                    text: entry.author.login,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).textTheme.body1.color,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: " via ",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: (entry.app ?? ""),
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 10.0),
              child: Row(
                children: <Widget>[
                  EntryToolbarButtonWidget(
                    CommunityMaterialIcons.link_variant,
                    "Kopiuj adres",
                    () {
                      Navigator.pop(context);
                      Utils.copyToClipboard(
                          contextmain, "https://www.wykop.pl/wpis/${entry.id}");
                    },
                  ),
                  EntryToolbarButtonWidget(
                      CommunityMaterialIcons.content_copy, "Kopiuj treść", () {
                    Navigator.pop(context);
                    Utils.copyToClipboard(contextmain,
                        parse(entry.body ?? "").documentElement.text);
                  }),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation != AuthorRelation.User,
                    child: EntryToolbarButtonWidget(
                        CommunityMaterialIcons.alert_octagon_outline, "Zgłoś",
                        () {
                      Navigator.pop(context);
                      Utils.launchURL(entry.violationUrl, context);
                    }),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation == AuthorRelation.User,
                    child: EntryToolbarButtonWidget(
                      CommunityMaterialIcons.square_edit_outline,
                      "Edytuj",
                      () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          Utils.getPageSlideToUp(
                            EditInputScreen(
                              id: entry.id,
                              inputData: InputData(body: entry.body),
                              inputType: InputType.ENTRY,
                              entryEdited: (editedEntry) =>
                                  entry.setData(editedEntry),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Visibility(
                    visible: authStateModel.loggedIn &&
                        relation == AuthorRelation.User,
                    child: EntryToolbarButtonWidget(
                      CommunityMaterialIcons.trash_can_outline,
                      "Usuń",
                      () async {
                        Navigator.pop(context);
                        if (await showConfirmDialog(
                            context, "Usunąć ten wpis?")) entry.delete();
                      },
                    ),
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
