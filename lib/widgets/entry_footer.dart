import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/owm_glyphs.dart';

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
            _buildIconButton(context, Icons.favorite_border),
            Expanded(child: Container()),
            _buildTextButton(context, Icons.chat_bubble_outline,
                entry.commentsCount.toInt().toString()),
            _buildTextButton(
                context, Icons.add, entry.voteCount.toInt().toString()),
            _buildIconButton(context, OwmGlyphs.dots_vertical),
          ]),
    );
  }

  Widget _buildTextButton(BuildContext context, IconData icon, String text) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon,
                  size: 20.0, color: Theme.of(context).textTheme.caption.color),
              Text(
                text,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Theme.of(context).textTheme.caption.color),
              ),
            ],
          )),
      onTap: () {},
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon,
                  size: 20.0, color: Theme.of(context).textTheme.caption.color),
            ],
          )),
      onTap: () {},
    );
  }
}
