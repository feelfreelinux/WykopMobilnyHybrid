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
            FooterIconButton(icon: Icons.share, onClicked: () {},),
            FooterIconButton(icon: Icons.favorite_border, onClicked: () {},),
            Expanded(child: Container()),
            TextButton(icon: Icons.chat_bubble_outline, text: entry.commentsCount.toInt().toString(), onClicked: () {},),
            TextButton(icon: Icons.add, text: entry.voteCount.toInt().toString(), onClicked: () {},),
            FooterIconButton(icon: OwmGlyphs.dots_vertical, onClicked: () {},)
          ]),
    );
  }
}
