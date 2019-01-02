import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'vote_counter.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  final bool isClickable;
  LinkWidget({this.linkId, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Key(linkId.toString()),
      padding: EdgeInsets.only(
        bottom: 3.0,
      ),
      child: GestureDetector(
        onTap: () {
          if (this.isClickable) {
            Navigator.push(
              context,
              Utils.getPageTransition(
                LinkScreen(
                  linkId: linkId,
                ),
              ),
            );
          }
        },
        child: Material(
          color: Theme.of(context).cardColor,
          child: StoreConnector<AppState, Link>(
            converter: (store) => store.state.entitiesState.links[linkId],
            builder: (context, link) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      AuthorWidget(
                        author: link.author,
                        date: link.date,
                        avatarSize: 30.0,
                        fontSize: 12.0,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                      ),
                      VoteCounterWidget(
                        voteState: "",
                        onClicked: () {},
                        count: link.voteCount,
                        size: 44.0,
                        isHot: link.isHot,
                        padding: EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 12.0,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      _drawImage(context, link),
                      _drawLinkFavicon(context, link),
                      _drawTitle(context, link),
                    ],
                  ),
                  _drawDescription(link),
                  LinkFooterWidget(link, this.isClickable),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _drawImage(BuildContext context, Link link) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
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
      child: GestureDetector(
        onTap: () => _launchURL(link.sourceUrl),
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
      ),
    );
  }

  Widget _drawTitle(BuildContext context, Link link) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        color: Theme.of(context).cardColor.withOpacity(0.8),
        child: Text(
          link.title.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _drawDescription(Link link) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12.0,
        top: 8.0,
        right: 12.0,
        bottom: 2.0,
      ),
      child: Text(
        link.description.replaceAll('&quot;', '"').replaceAll('&amp;', '&'),
        style: TextStyle(
          fontSize: 13.0,
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Nie można załadować linku';
    }
  }
}
