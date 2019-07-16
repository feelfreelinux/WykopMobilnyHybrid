import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'vote_counter.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  LinkWidget({this.linkId});

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
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    AuthorWidget(
                      author: link.author,
                      date: link.date,
                      fontSize: 14.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
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
                GestureDetector(
                  onTap: () => Utils.launchURL(link.sourceUrl),
                  child: Stack(
                    children: [
                      _drawImage(context, link),
                      _drawLinkFavicon(context, link),
                    ],
                  ),
                ),
                GestureDetector(
                  key: Key(linkId.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      Utils.getPageTransition(
                        LinkScreen(
                          linkId: linkId,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _drawTitle(context, link),
                      _drawDescription(link),
                    ],
                  ),
                ),
                LinkFooterWidget(link, true),
                DividerWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _drawImage(BuildContext context, Link link) {
    return Container(
      width: MediaQuery.of(context).size.width - 36.0,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
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
        left: 2.0,
        top: 12.0,
        right: 2.0,
        bottom: 6.0,
      ),
      child: Text(
        link.title.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(
          height: 1.1,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _drawDescription(Link link) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 2.0,
      ),
      child: Text(
        link.description.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
        style: TextStyle(
          height: 1.1,
          fontSize: 13.5,
        ),
      ),
    );
  }
}
