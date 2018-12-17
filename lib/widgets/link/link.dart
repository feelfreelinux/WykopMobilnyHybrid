import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/utils/utils.dart';
import 'vote_counter.dart';
import 'package:owmflutter/utils/utils.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkWidget extends StatelessWidget {
  final int linkId;
  LinkWidget({this.linkId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Key(linkId.toString()),
      padding: EdgeInsets.only(
        bottom: 8.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, Utils.getPageTransition(LinkScreen(linkId: linkId)));
        },
        child: Material(
          elevation: 1,
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
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                      ),
                      VoteCounterWidget(
                        onClicked: () {},
                        voteState: "",
                        count: link.voteCount,
                        isHot: link.isHot,
                        size: 48.0,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
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
                                  horizontal: 8.0,
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image(
                                      image: AdvancedNetworkImage(
                                        'http://s2.googleusercontent.com/s2/favicons?domain_url=' +
                                            link.sourceUrl,
                                        useDiskCache: true,
                                      ),
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
                                          shadows: [Shadow(blurRadius: 2)],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8.0,
                                  top: 8.0,
                                  bottom: 12.0,
                                  right: 8.0,
                                ),
                                child: Text(
                                  link.title.replaceAll('&quot;', ''),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 2,
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
                      top: 8.0,
                      right: 8.0,
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
      ),
    );
  }
}
