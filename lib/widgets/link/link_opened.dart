import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'vote_counter.dart';
import 'package:owmflutter/owm_glyphs.dart';

class LinkOpenedWidget extends StatelessWidget {
  final int linkId;
  LinkOpenedWidget({this.linkId});

  @override
  Widget build(BuildContext context) {
    return Material(
      key: Key(linkId.toString()),
      color: Theme.of(context).cardColor,
      child: StoreConnector<AppState, Link>(
        converter: (store) => store.state.entitiesState.links[linkId],
        builder: (context, link) {
          if (link == null) {
            return Container();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: Row(
                  children: <Widget>[
                    AuthorWidget(
                      author: link.author,
                      date: link.date,
                      fontSize: 14.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    ),
                    VoteCounterWidget(
                      voteState: "",
                      onClicked: () {},
                      count: link.voteCount,
                      size: 48.0,
                      isHot: link.isHot,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Utils.launchURL(link.sourceUrl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: [
                        _drawImage(context, link),
                        _drawLinkFavicon(context, link),
                      ],
                    ),
                    _drawTitle(context, link),
                    _drawDescription(link),
                  ],
                ),
              ),
              _drawTags(link),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
                child: LinkFooterWidget(link, false),
              ),
              DividerWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
              ),
              _drawRelated(context, link),
              DividerWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.0,
                ),
              ),
              _drawCommentHeader(context, link),
            ],
          );
        },
      ),
    );
  }

  Widget _drawCommentHeader(BuildContext context, Link link) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 14.0,
        right: 18.0,
        bottom: 2.0,
      ),
      child: Row(
        children: <Widget>[
          Text(
            link.commentsCount.toString(),
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            " " +
                Utils.polishPlural(
                  count: link.commentsCount,
                  first: "Komentarz",
                  many: "Komentarzy",
                  other: "Komentarze",
                ),
            style: TextStyle(
              fontSize: 16.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            child: Icon(
              OwmGlyphs.ic_sort,
            ),
            onTap: () {
              //TODO add sorting comments
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Niezaimplementowano'),
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _drawRelated(BuildContext context, Link link) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
            vertical: 14.0,
          ),
          child: Row(
            children: <Widget>[
              Text(
                link.relatedCount.toString(),
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                " " +
                    Utils.polishPlural(
                      count: link.relatedCount,
                      first: "Powiązany",
                      many: "Powiązanych",
                      other: "Powiązane",
                    ),
                style: TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(child: Container()),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 10.0,
                  ),
                  child: Text(
                    "Dodaj link",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  //TODO add a related add screen
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Niezaimplementowano'),
                  ));
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 18.0,
          ),
          child: link.relatedCount > 0
              ? StoreConnector<AppState, List<int>>(
                  converter: (store) =>
                      store.state.linkScreensState?.states[linkId.toString()]
                          ?.relatedLinks ??
                      [],
                  builder: (context, relatedLinks) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Row(
                          children: relatedLinks
                              .map((id) => RelatedWidget(
                                    id: id,
                                    count: link.relatedCount,
                                  ))
                              .toList(),
                        ),
                      ),
                    );
                  },
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Text(
                    "Brak linków powiązanych ze znaleziskiem.",
                  ),
                ),
        ),
      ],
    );
  }

  Widget _drawImage(BuildContext context, Link link) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0x33000000))],
        image: DecorationImage(
          image: AdvancedNetworkImage(
            link.preview != null
                ? link.preview
                : 'https://www.wykop.pl/cdn/c2526412/no-picture-night.jpg',
            useDiskCache: true,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _drawLinkFavicon(BuildContext context, Link link) {
    return Positioned(
      right: 0,
      child: Container(
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withOpacity(0.8),
          border: Border.all(
            color: Color(0x337f7f7f),
            width: 0.5,
          ),
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
                image: AdvancedNetworkImage(
                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                        link.sourceUrl),
                height: 10.0,
                width: 10.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0,
              ),
              child: Text(
                link.sourceUrl
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

  Widget _drawTitle(BuildContext context, Link link) {
    return Container(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 12.0,
        right: 18.0,
      ),
      child: Text(
        link.title.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
        style: TextStyle(
          height: 1.1,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _drawDescription(Link link) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 10.0,
        right: 18.0,
      ),
      child: Text(
        link.description.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
        style: TextStyle(
          height: 1.1,
        ),
      ),
    );
  }

  Widget _drawTags(Link link) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 10.0,
        right: 18.0,
      ),
      child: Text(
        link.tags,
        style: TextStyle(
          height: 1.1,
        ),
      ),
    );
  }
}
