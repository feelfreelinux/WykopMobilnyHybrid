import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/store/store.dart';

class AddEntries implements TypedAction {
  final List<int> entriesIds;
  final String type;
  AddEntries({this.type, this.entriesIds});
}

class ClearEntries implements TypedAction {
  final String type;
  ClearEntries({this.type});
}
