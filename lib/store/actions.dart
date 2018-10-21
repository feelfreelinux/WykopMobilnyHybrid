import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class LoadHotAction {}

class SetEntriesAction {
  final BuiltList<Entry> entries;
  SetEntriesAction({this.entries});
}
