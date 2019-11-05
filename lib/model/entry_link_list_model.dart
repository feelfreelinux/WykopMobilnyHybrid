import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryLinkListmodel extends ListModel<EntryLink, dynamic> {
  final LoadNewItemsCallback<EntryLink> loadNewEntryLinks;

  EntryLinkListmodel({this.loadNewEntryLinks, BuildContext context})
      : super(
          loadNewItems: (page) => OWMContentFilter.filterEntryLinks(loadNewEntryLinks(page), context),
          mapper: (e) => e.hasEntry
              ? (EntryModel()..setData(e.isExpanded ? e.entry : e.entry.rebuild((b) => b.isExpanded = false)))
              : (LinkModel()..setData(e.isExpanded ? e.link : e.link.rebuild((b) => b.isExpanded = false))),
        );
}
