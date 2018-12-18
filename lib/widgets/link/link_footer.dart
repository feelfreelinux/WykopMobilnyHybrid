import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';
import 'package:owmflutter/utils/utils.dart';

class LinkFooterWidget extends StatelessWidget {
  final Link link;
  final int linkId;
  LinkFooterWidget({this.link, this.linkId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FavoriteButton(
            isFavorite: false,
            onClicked: () {},
          ),
          CommentsButton(
            count: link.commentsCount,
            onClicked: () {
              Navigator.push(
                  context, Utils.getPageTransition(LinkScreen(linkId: linkId)));
            },
          ),
          ShareButton(onClicked: () {}),
        ],
      ),
    );
  }
}
