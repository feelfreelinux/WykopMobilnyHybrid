import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/model/link_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:provider/provider.dart';
import 'vote_counter.dart';
import 'package:owmflutter/owm_glyphs.dart';

class LinkOpenedWidget extends StatelessWidget {
  LinkOpenedWidget();

  @override
  Widget build(BuildContext context) {
    return Consumer<LinkModel>(
      builder: (context, model, _) => Material(
        key: Key(model.id.toString()),
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AuthorWidget(
                      author: model.author,
                      date: model.date,
                      fontSize: 14.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  VoteCounterWidget(
                    voteState: "",
                    onTap: () {},
                    count: model.voteCount,
                    size: 48.0,
                    isHot: model.isHot,
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Utils.launchURL(model.sourceUrl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Stack(
                    children: [
                      _drawImage(context, model.preview),
                      _drawLinkFavicon(context, model.sourceUrl),
                    ],
                  ),
                  _drawTitle(context, model.title),
                  _drawDescription(model.description),
                ],
              ),
            ),
            _drawTags(model.tags),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
              child: LinkFooterWidget(
                  linkId: model.id, linkTitle: model.title, isClickable: false),
            ),
            DividerWidget(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
            ),
            _drawRelated(context, model),
            DividerWidget(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
              ),
            ),
            _drawCommentHeader(context, model),
          ],
        ),
      ),
    );
  }

  Widget _drawCommentHeader(BuildContext context, LinkModel link) {
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

  Widget _drawRelated(BuildContext context, LinkModel link) {
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
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
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

  Widget _drawImage(BuildContext context, String preview) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Color(0x33000000))],
        image: DecorationImage(
          image: AdvancedNetworkImage(
            preview != null
                ? preview
                : 'https://www.wykop.pl/cdn/c2526412/no-picture-night.jpg',
            useDiskCache: true,
          ),
          fit: BoxFit.cover,
        ),
      ),
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

  Widget _drawTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 12.0,
        right: 18.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          height: 1.1,
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _drawDescription(String description) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 10.0,
        right: 18.0,
      ),
      child: Text(
        description,
        style: TextStyle(
          height: 1.1,
        ),
      ),
    );
  }

  Widget _drawTags(String tags) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.0,
        top: 10.0,
        right: 18.0,
      ),
      child: Text(
        tags,
        style: TextStyle(
          height: 1.1,
        ),
      ),
    );
  }
}
