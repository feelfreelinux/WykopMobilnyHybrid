import 'package:flutter/foundation.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/model/model.dart';

class EntryListModel extends ListModel<Entry, EntryModel> {
  final LoadNewItemsCallback<Entry> loadNewEntries;

  EntryListModel({this.loadNewEntries})
      : super(
            loadNewItems: loadNewEntries,
            mapper: (e) => EntryModel()..setData(e));
}
