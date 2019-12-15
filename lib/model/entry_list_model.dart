import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:owmflutter/content_filters/content_filters.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryListModel extends ListModel<Entry, EntryModel> {
  final LoadNewItemsCallback<Entry> loadNewEntries;

  EntryListModel({this.loadNewEntries, BuildContext context})
      : super(
            loadNewItems: (page) => OWMContentFilter.filterEntries(loadNewEntries(page), context),
            mapper: (e) => EntryModel()..setData(e));
}
