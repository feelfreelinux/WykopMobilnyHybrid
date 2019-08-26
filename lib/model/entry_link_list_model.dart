import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryLinkListmodel extends ListModel<EntryLink, dynamic> {
  final LoadNewItemsCallback<EntryLink> loadNewEntryLinks;

  EntryLinkListmodel({this.loadNewEntryLinks})
      : super(
          loadNewItems: loadNewEntryLinks,
          mapper: (e) => e.hasEntry
              ? (EntryModel()..setData(e.entry))
              : (LinkModel()..setData(e.link)),
        );
}
