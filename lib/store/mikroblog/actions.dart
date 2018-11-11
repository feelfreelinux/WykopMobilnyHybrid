import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class LoadHotAction {}

class LoadEntry {
  final int entryId;
  LoadEntry({this.entryId});
}

class UpdateEntryAction {
  final Entry entry;
  UpdateEntryAction({this.entry});
}

class SetEntriesAction {
  final BuiltList<Entry> entries;
  SetEntriesAction({this.entries});
}

class AddEntriesAction {
  final BuiltList<Entry> entries;
  AddEntriesAction({this.entries});
}

class SetLoading {
  final bool isLoading;
  SetLoading({this.isLoading});
}

class SetPageNumber {
  final int number;
  SetPageNumber({this.number});
}

class SetHaveReachedEnd {
  final bool haveReachedEnd;
  SetHaveReachedEnd({this.haveReachedEnd});
}
