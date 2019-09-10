import 'package:flutter/foundation.dart';
import 'package:owmflutter/model/entry_comment_model.dart';
import 'package:owmflutter/model/input_model.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/api/api.dart';

typedef void EntryCreatedCallback(Entry entry);

class NewEntryModel extends InputModel {
  final EntryCreatedCallback entryCreated;
  NewEntryModel({this.entryCreated});
  @override
  Future<void> onInputSubmitted(InputData data) async {
    var entry = await api.entries.addEntry(data);
    entryCreated(entry);
  }
}
