import 'package:flutter/material.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/widgets/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:owmflutter/store/store.dart';

class EntryWidget extends StatelessWidget {
  final int entryId;
  final bool ellipsize;
  EntryWidget({this.entryId, this.ellipsize});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: 3.0),
        child: Material(
            color: Theme.of(context).cardColor,
            elevation: 0.0,
            child: StoreConnector<AppState, Entry>(
                converter: (store) =>
                    store.state.entitiesState.entries[entryId],
                builder: (context, entry) {
                  return Column(
                    children: _buildEntryBody(entry),
                  );
                })));
  }

  List<Widget> _buildEntryBody(Entry entry) {
    if (entry.embed == null) {
      return [
        AuthorWidget(author: entry.author, date: entry.date),
        BodyWidget(
          body: entry.body,
          ellipsize: ellipsize,
        ),
        EntryFooterWidget(entry: entry),
      ];
    } else {
      return [
        AuthorWidget(author: entry.author, date: entry.date),
        BodyWidget(
          body: entry.body,
          ellipsize: ellipsize,
        ),
        EmbedWidget(embed: entry.embed),
        EntryFooterWidget(entry: entry),
      ];
    }
  }
}
