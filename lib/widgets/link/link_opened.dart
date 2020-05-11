import 'dart:ui';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/model/model.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';

class LinkOpenedWidget extends StatefulWidget {
  @override
  _LinkOpenedWidgetState createState() => _LinkOpenedWidgetState();
}

class _LinkOpenedWidgetState extends State<LinkOpenedWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthStateModel>(
      builder: (context, authStateModel, _) => Consumer<LinkModel>(
        builder: (context, model, _) => Material(
          key: Key(model.id.toString()),
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onLongPress: () =>
                    _showActionsDialog(context, model, authStateModel),
                onTap: () => Utils.launchURL(model.sourceUrl, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 50.0),
                          child: _drawImage(context, model.preview),
                        ),
                        _drawLinkFavicon(context, model.sourceUrl),
                        Visibility(
                          visible: model.voteState != LinkVoteState.NONE,
                          child: Positioned(
                            bottom: 110.0,
                            right: 0.0,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              decoration: BoxDecoration(
                                color: model.voteState == LinkVoteState.DIGGED
                                    ? Color(0xff3b915f)
                                    : Color(0xffc0392b),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                model.voteState == LinkVoteState.DIGGED
                                    ? "Wykopane"
                                    : "Zakopane",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          child: _shadowHeaderWidget(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 2.0),
                              child: Stack(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: AuthorWidget(
                                          author: model.author,
                                          date: model.date,
                                          fontSize: 15.0,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                        ),
                                      ),
                                      VoteCounterWidget(
                                        voteState: model.voteState,
                                        onTap: () {
                                          if (model.voteState !=
                                              LinkVoteState.NONE) {
                                            model.voteRemove();
                                          } else {
                                            model.voteUp();
                                          }
                                        },
                                        onLongPress: () {
                                          if (model.voteState !=
                                              LinkVoteState.NONE) {
                                            model.voteRemove();
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  BuryReasonDialog(
                                                callback: (reason) =>
                                                    model.voteDown(reason),
                                              ),
                                            );
                                          }
                                        },
                                        count: model.voteCount,
                                        size: 48.0,
                                        isHot: model.isHot,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onLongPress: () =>
                    _showActionsDialog(context, model, authStateModel),
                onTap: () => Utils.launchURL(model.sourceUrl, context),
                child: _drawTitle(model.title),
              ),
              GestureDetector(
                onLongPress: () =>
                    _showActionsDialog(context, model, authStateModel),
                onTap: () => Utils.launchURL(model.sourceUrl, context),
                child: _drawDescription(model.description),
              ),
              _drawTags(model.tags),
              _drawRelated(context, model),
              _drawCommentHeader(context, model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shadowHeaderWidget({Widget child}) {
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

  Widget _drawCommentHeader(BuildContext context, LinkModel link) {
    return _shadowHeaderWidget(
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.0, 12.0, 10.0, 14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              link.commentsCount.toString() +
                  " " +
                  Utils.polishPlural(
                    count: link.commentsCount,
                    first: "komentarz",
                    many: "komentarzy",
                    other: "komentarze",
                  ),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Najstarsze",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Icon(CommunityMaterialIcons.chevron_right, size: 21.0),
                  ],
                ),
              ),
              onTap: () => _openCommentsSortDialog(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawRelated(BuildContext context, LinkModel link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _shadowHeaderWidget(
          child: Padding(
            padding: EdgeInsets.fromLTRB(18.0, 12.0, 10.0, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  link.relatedCount.toString() +
                      " " +
                      Utils.polishPlural(
                        count: link.relatedCount,
                        first: "powiązany",
                        many: "powiązanych",
                        other: "powiązane",
                      ),
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Dodaj link",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Icon(CommunityMaterialIcons.chevron_right, size: 21.0),
                      ],
                    ),
                  ),
                  onTap: () => _openAddRelatedDialog(),
                ),
              ],
            ),
          ),
        ),
        link.relatedCount > 0
            ? Column(
                children: link.relatedLinks
                    .map((id) =>
                        RelatedWidget(related: id, count: link.relatedCount))
                    .toList(),
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 4.0),
                child: Text("Brak linków powiązanych ze znaleziskiem."),
              ),
      ],
    );
  }

  Widget _drawImage(BuildContext context, String preview) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Utils.backgroundGrey(context)),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).iconTheme.color),
              strokeWidth: 2.0,
            ),
          ),
        ),
        OWMSettingListener(
          rebuildOnChange: (settings) => settings.highResImageLinkStream,
          builder: (context, settings) => Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: preview != null
                    ? NetworkImage(
                        settings.highResImageLink
                            ? preview
                            : preview.replaceAll(".jpg", ",w207h139.jpg"),
                      )
                    : AssetImage(
                        Theme.of(context).brightness == Brightness.light
                            ? 'assets/no_picture.jpg'
                            : 'assets/no_picture_night.jpg',
                      ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 240,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).backgroundColor.withOpacity(0.2),
                Theme.of(context).backgroundColor.withOpacity(0.0)
              ],
              stops: [0.0, 1.0],
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String sourceUrl) {
    return Positioned(
      right: 0.0,
      bottom: 70.0,
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          border: Border.all(color: Color(0x337f7f7f), width: 0.5),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.circle,
              ),
              child: Image(
                image: NetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=$sourceUrl'),
                height: 10.0,
                width: 10.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                sourceUrl
                    .replaceAll('https://', '')
                    .replaceAll('http://', '')
                    .replaceAll('www.', '')
                    .split('/')[0],
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 0.0, right: 18.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _drawDescription(String description) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 0.0, right: 18.0),
      child: Text(description, style: TextStyle(fontSize: 16.0)),
    );
  }

  Widget _drawTags(String tags) {
    return Visibility(
      visible: tags != null,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 2.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
              fontSize: 16.0,
            ),
            children: (tags ?? "")
                .split(' ')
                .map((String text) => ClickableTextSpan(
                      text: text + " ",
                      onTap: () => Navigator.push(
                          context,
                          Utils.getPageSlideToUp(
                              TagScreen(tag: text.replaceAll("#", "")))),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  void _openAddRelatedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return GreatDialogWidget(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? null
                  : (MediaQuery.of(context).size.width / 2) + 28.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Dodaj powiązany link",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
                    decoration: BoxDecoration(
                      color: Utils.backgroundGreyOpacity(context),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      cursorRadius: Radius.circular(20.0),
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: InputBorder.none,
                        hintText: "Podaj adres URL strony, którą chcesz dodać",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
                    decoration: BoxDecoration(
                      color: Utils.backgroundGreyOpacity(context),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextField(
                      cursorRadius: Radius.circular(20.0),
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        border: InputBorder.none,
                        hintText: "Napisz krótki opisujący stronę tytuł",
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text("Oznacz link jako 18+"),
                        ),
                        Switch(
                          //TODO: 18+ related switch
                          value: true,
                          onChanged: (v) {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () {}, //TODO: akcja dodania powiazanych
                      child: Container(
                        constraints: BoxConstraints(minWidth: double.infinity),
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 12.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Dodaj link",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _openCommentsSortDialog() {
    showDialog(
      //TODO: podpiąć sortowanie komentarzy
      context: context,
      builder: (context) {
        return GreatDialogWidget(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? null
                  : (MediaQuery.of(context).size.width / 2) + 28.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 14.0),
                    child: Text(
                      "Sortuj komentarze",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _radioButton("Najlepsze", false, () {}),
                      _radioButton("Najnowsze", false, () {}),
                      _radioButton("Najstarsze", true, () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _radioButton(String title, bool isSelected, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Utils.backgroundGreyOpacity(context),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 1.0, right: 10.0),
                child: Icon(
                  isSelected
                      ? CommunityMaterialIcons.radiobox_marked
                      : CommunityMaterialIcons.radiobox_blank,
                  size: 20.0,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showActionsDialog(
    BuildContext contextmain,
    LinkModel model,
    AuthStateModel authStateModel,
  ) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: contextmain,
      builder: (BuildContext context) =>
          LinkToolbarWidget(contextmain, model, authStateModel),
    );
  }
}
