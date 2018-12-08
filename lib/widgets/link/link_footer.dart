import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:owmflutter/screens/screens.dart';

class LinkFooterWidget extends StatelessWidget {
  final Link link;
  LinkFooterWidget({this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            text: " udostępnij",
            icon: OwmGlyphs.ic_buttontoolbar_share,
            onClicked: () {},
          ),
          FavoriteButton(
            onClicked: () {},
          ),
          Expanded(
            child: Container(),
          ),
          CommentsButton(
            count: link.commentsCount,
            onClicked: () {},
          ),
        ],
      ),
    );
  }
}
