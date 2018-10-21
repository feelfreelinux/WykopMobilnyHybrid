import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';

class LoadHotAction {}

class SetEntriesAction {
  final BuiltList<EntryResponse> entries;
  SetEntriesAction({this.entries});
}
