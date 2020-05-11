import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:html/parser.dart';
import 'package:share/share.dart';

class EntryCommentToolbarWidget extends StatelessWidget {
  final BuildContext contextmain;
  final EntryCommentModel model;
  final InputModel inputModel;
  final AuthStateModel authStateModel;
  final EntryCommentWidget entryWidget;

  EntryCommentToolbarWidget(
    this.contextmain,
    this.model,
    this.inputModel,
    this.authStateModel,
    this.entryWidget,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black38)],
      ),
      margin: MediaQuery.of(context).orientation == Orientation.landscape &&
              !authStateModel.loggedIn
          ? EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width - 28) / 4,
            )
          : null,
      padding: EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 0.0),
            padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: RichText(
              text: TextSpan(
                text: model.author.login,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).textTheme.body1.color,
                ),
                children: model.app != null
                    ? <TextSpan>[
                        TextSpan(
                            text: " via ",
                            style: TextStyle(fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: (model.app ?? ""),
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ]
                    : null,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Wrap(
            children: [
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.share_variant,
                title: "Udostępnij",
                onTap: () {
                  Navigator.pop(context);
                  Share.share(
                      "https://www.wykop.pl/wpis/${entryWidget.entryId}/#comment-${model.id}");
                },
                disabled: entryWidget.entryId == 0,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.content_copy,
                title: "Kopiuj tekst",
                onTap: () {
                  Navigator.pop(context);
                  Utils.copyToClipboard(contextmain,
                      parse(model.body ?? "").documentElement.text);
                },
                visible: model.body != "​​​​​" && model.body != null,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.file_image,
                title: "Zapisz obraz",
                onTap: () async {
                  Navigator.pop(context);
                  await ImageDownloader.downloadImage(model.embed.url);
                  Scaffold.of(contextmain).showSnackBar(
                      SnackBar(content: Text("Obrazek został zapisany")));
                },
                visible: !(model.body != "​​​​​" && model.body != null),
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.account_plus,
                title: "Plusujący",
                onTap: () async {
                  Navigator.pop(context);
                  await model.loadUpVoters();
                  if (model.upvoters.length != 0)
                    _showVotersDialog(context, model);
                },
                disabled: model.voteCount == 0,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.format_quote_open,
                title: "Cytuj",
                onTap: () {
                  Navigator.pop(context);
                  inputModel.inputBarKey.currentState.quoteText(
                      parse(model.body ?? "").documentElement.text,
                      author: model.author);
                }, //TODO ogarnąć to w widoku profili, brakuje entryId
                disabled: entryWidget.entryId == 0 ||
                    !(model.body != null && model.body != "​​​​​"),
                visible: authStateModel.loggedIn,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.reply,
                title: "Odpowiedz",
                onTap: () {
                  Navigator.pop(context);
                  inputModel.inputBarKey.currentState.replyToUser(model.author);
                },
                disabled: entryWidget.entryId == 0,
                visible: authStateModel.loggedIn &&
                    entryWidget.relation != AuthorRelation.User,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.alert_octagon_outline,
                title: "Zgłoś",
                onTap: () {
                  Navigator.pop(context);
                  Utils.launchURL(model.violationUrl, context);
                },
                visible: authStateModel.loggedIn &&
                    entryWidget.relation != AuthorRelation.User,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.square_edit_outline,
                title: "Edytuj",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    Utils.getPageSlideToUp(
                      EditInputScreen(
                        id: model.id,
                        inputData: InputData(body: model.body),
                        inputType: InputType.ENTRY_COMMENT,
                        commentEdited: (editedComment) =>
                            model.setData(editedComment),
                      ),
                    ),
                  );
                },
                visible: authStateModel.loggedIn &&
                    entryWidget.relation == AuthorRelation.User,
              ),
              ToolbarButtonWidget(
                icon: CommunityMaterialIcons.trash_can_outline,
                title: "Usuń",
                onTap: () async {
                  Navigator.pop(context);
                  if (await showConfirmDialog(
                      context, "Usunąć ten komentarz?")) {
                    model.delete();
                  }
                },
                visible: authStateModel.loggedIn &&
                    entryWidget.relation == AuthorRelation.User,
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }

  void _showVotersDialog(BuildContext context, EntryCommentModel voters) {
    showDialog(
      context: context,
      builder: (context) => EntryVotersWidget(voters.upvoters),
    );
  }
}
