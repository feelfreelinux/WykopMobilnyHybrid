import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';

class EntryFooterWidget extends StatelessWidget {
  final Entry entry;
  EntryFooterWidget({this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FooterIconButton(
              icon: OwmGlyphs.ic_buttontoolbar_share,
              onClicked: () {},
            ),
            FavoriteButton(
              onClicked: () {},
            ),
            Expanded(child: Container()),
            CommentsButton(
              count: entry.commentsCount,
              onClicked: () {},
            ),
            VoteButton(
              count: entry.voteCount,
              onClicked: () {},
            ),
            FooterIconButton(
              icon: OwmGlyphs.ic_buttontoolbar_dots,
              onClicked: () {},
            )
          ]),
    );
  }
}
