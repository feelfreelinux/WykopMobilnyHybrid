import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EntryWidget extends StatelessWidget {
  final Entry entry;
  EntryWidget({this.entry});

  @override
  Widget build(BuildContext context) {
    if (entry.embed == null) {
      return Card(
        margin: EdgeInsets.all(4.0),
        elevation: 0.9,
        child: Column(
          children: <Widget>[
            AuthorWidget(author: entry.author, date: entry.date),
            EntryBodyWidget(entry: entry),
            EntryFooterWidget(entry: entry),
          ],
        ),
      );
    } else {
      return Card(
        margin: EdgeInsets.all(4.0),
        elevation: 0.9,
        child: Column(
          children: <Widget>[
            AuthorWidget(author: entry.author, date: entry.date),
            EntryBodyWidget(entry: entry),
            EntryEmbedWidget(embed: entry.embed),
            EntryFooterWidget(entry: entry),
          ],
        ),
      );
    }
  }
}
