import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/link/votes_buttons.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';

class LinkOpenedWidget extends StatefulWidget {
  @override
  _LinkOpenedWidgetState createState() => _LinkOpenedWidgetState();
}

class _LinkOpenedWidgetState extends State<LinkOpenedWidget> {
  bool showButtonsState = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _drawTitle(model.title),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
              child: Stack(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AuthorWidget(
                          author: model.author,
                          date: model.date,
                          fontSize: 15.0,
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                      VoteCounterWidget(
                        voteState: model.voteState,
                        onTap: () {
                          if (model.voteState != LinkVoteState.NONE) {
                            model.voteRemove();
                            return;
                          }
                          setState(() => showButtonsState = !showButtonsState);
                        },
                        count: model.voteCount,
                        size: 48.0,
                        isHot: model.isHot,
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                    ],
                  ),
                  VotesButtonsWidget(
                    showButtonsState: showButtonsState,
                    onTapUpVote: () {
                      model.voteUp();
                      setState(() => showButtonsState = false);
                    },
                    onTapDownVote: () {
                      showDialog(
                        context: context,
                        builder: (context) => BuryReasonDialog(
                          callback: (reason) => model.voteDown(reason),
                        ),
                      );
                      setState(() => showButtonsState = false);
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Utils.launchURL(model.sourceUrl, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      _drawImage(context, model.preview),
                      _drawLinkFavicon(context, model.sourceUrl),
                    ],
                  ),
                  _drawDescription(model.description),
                ],
              ),
            ),
            _drawTags(model.tags),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: LinkFooterWidget(link: model, isClickable: false),
            ),
            DividerWidget(padding: EdgeInsets.symmetric(horizontal: 18.0)),
            _drawRelated(context, model),
            DividerWidget(padding: EdgeInsets.symmetric(horizontal: 18.0)),
            _drawCommentHeader(context, model),
          ],
        ),
      ),
    );
  }

  Widget _drawCommentHeader(BuildContext context, LinkModel link) {
    return Padding(
      padding:
          EdgeInsets.only(left: 18.0, right: 10.0, top: 14.0, bottom: 14.0),
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
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
              child: Text(
                "NAJSTARSZE",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            onTap: () => _openCommentsSortDialog(),
          ),
        ],
      ),
    );
  }

  Widget _drawRelated(BuildContext context, LinkModel link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: 18.0, right: 10.0, top: 14.0, bottom: 14.0),
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
                  padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
                  child: Text(
                    "DODAJ LINK",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                onTap: () => _openAddRelatedDialog(),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 18.0),
          child: link.relatedCount > 0
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: link.relatedLinks
                          .map((id) => RelatedWidget(
                                related: id,
                                count: link.relatedCount,
                              ))
                          .toList(),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text("Brak linków powiązanych ze znaleziskiem."),
                ),
        ),
      ],
    );
  }

  Widget _drawImage(BuildContext context, String preview) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
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
            height: 180,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0x33000000))],
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
      ],
    );
  }

  Widget _drawLinkFavicon(BuildContext context, String sourceUrl) {
    return Positioned(
      right: 0,
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(2.0),
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
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: NetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                        sourceUrl),
                height: 10.0,
                width: 10.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Text(
                sourceUrl
                    .replaceAll('https://', '')
                    .replaceAll('http://', '')
                    .replaceAll('www.', '')
                    .split('/')[0],
                style: TextStyle(
                  fontSize: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 6.0, right: 18.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _drawDescription(String description) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 16.0, right: 18.0),
      child: Text(description, style: TextStyle(fontSize: 16.0)),
    );
  }

  Widget _drawTags(String tags) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 10.0, right: 18.0),
      child: Text(tags),
    );
  }

  void _openAddRelatedDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return GreatDialogWidget(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Dodaj powiązany link",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 18.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Utils.backgroundGreyOpacity(context),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  cursorRadius: Radius.circular(20.0),
                  style: TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    border: InputBorder.none,
                    hintText: "Podaj adres URL strony, którą chcesz dodać",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
                decoration: BoxDecoration(
                  color: Utils.backgroundGreyOpacity(context),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  cursorRadius: Radius.circular(20.0),
                  style: TextStyle(fontSize: 14.0),
                  decoration: InputDecoration(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
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
          padding: EdgeInsets.zero,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Sortuj komentarze",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile(
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).pop();
                      },
                      value: 1,
                      title: Text("Najlepsze"),
                    ),
                    RadioListTile(
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).pop();
                      },
                      value: 2,
                      title: Text("Najnowsze"),
                    ),
                    RadioListTile(
                      groupValue: 1,
                      onChanged: (value) {
                        Navigator.of(context).pop();
                      },
                      value: 3,
                      title: Text("Najstarsze"),
                    ),
                  ],
                ),
                SizedBox(height: 18.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
