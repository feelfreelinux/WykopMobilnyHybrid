import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';
import 'package:owmflutter/widgets/widgets.dart';

class EntryCommentFooterWidget extends StatelessWidget {
  final EntryComment comment;
  EntryCommentFooterWidget({this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FooterIconButton(
              icon: OwmGlyphs.ic_buttontoolbar_share,
              onClicked: () {},
            ),
            FooterIconButton(
              icon: OwmGlyphs.ic_buttontoolbar_reply,
              onClicked: () {},
            ),
            Expanded(child: Container()),
            VoteButton(
              count: comment.voteCount,
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
