import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/utils/utils.dart';
import 'vote_counter.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  LinkWidget({this.linkId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Material(
        elevation: 0.5,
        shadowColor: Color(0x80000000),
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
                      avatarSize: 38.0,
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12.0,
                      ),
                    ),
                    VoteCounterWidget(
                      onClicked: () {},
                      voteState: "",
                      count: link.voteCount,
                      isHot: link.isHot,
                      size: 48.0,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Image(
                      image: AdvancedNetworkImage(
                        link.preview != null
                            ? link.preview
                            : 'https://www.wykop.pl/cdn/c2526412/no-picture-night.jpg',
                        useDiskCache: true,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color(0x00000000),
                              Color(0x80000000),
                            ])),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.0,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Image.network(
                                    'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                                        link.sourceUrl,
                                    height: 12.0,
                                    width: 12.0,
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
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        shadows: [Shadow(blurRadius: 1.5)],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 12.0,
                                top: 8.0,
                                bottom: 14.0,
                                right: 12.0,
                              ),
                              child: Text(
                                link.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 1.5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.0,
                    top: 12.0,
                    right: 12.0,
                    bottom: 4.0,
                  ),
                  child: Text(
                    link.description,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                LinkFooterWidget(link: link),
              ],
            );
          },
        ),
      ),
    );
  }
}
