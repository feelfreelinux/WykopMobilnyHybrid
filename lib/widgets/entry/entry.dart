import 'package:flutter/material.dart';
import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EntryWidget extends StatelessWidget {
  final Entry entry;
  final bool ellipsize;
  EntryWidget({this.entry, this.ellipsize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
      child: InkWell(
          onTap: () {},
          child: Material(
            color: Theme.of(context).cardColor,
            elevation: 0.0,
            child: Column(
              children: _buildEntryBody(),
            ),
          )),
    );
  }

  List<Widget> _buildEntryBody() {
    if (entry.embed == null) {
      return [
        AuthorWidget(author: entry.author, date: entry.date),
        EntryBodyWidget(entry: entry, ellipsize: ellipsize,),
        EntryFooterWidget(entry: entry),
      ];
    } else {
      return [
        AuthorWidget(author: entry.author, date: entry.date),
        EntryBodyWidget(entry: entry, ellipsize: ellipsize,),
        EmbedWidget(embed: entry.embed),
        EntryFooterWidget(entry: entry),
      ];
    }
  }
}
