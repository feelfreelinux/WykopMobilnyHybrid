import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';

import 'package:built_collection/built_collection.dart';

class Result {
  final List<int> result;
  final EntitiesState state;
  Result({this.result, this.state});
}

Result normalizeEntries(BuiltList<EntryResponse> entries) {
  var mappedEntries = entries.map((c) => Entry.mapFromResponse(c));
  var entriesMap = Map<int, Entry>.from(Map.fromIterable(mappedEntries, key: (v) => v.id, value: (v) => v));
  var ids = entries.map((e) => e.id);

  return Result(result: ids.toList(),
    state: EntitiesState().rebuild((b) => b..entries.addAll(entriesMap)));
}

Result normalizeEntryComments(BuiltList<EntryCommentResponse> comments) {
  var mappedComments = comments.map((c) => EntryComment.mapFromResponse(c));
  var commentsMap = Map<int, EntryComment>.from(Map.fromIterable(mappedComments, key: (v) => v.id, value: (v) => v));
  var ids = comments.map((e) => e.id);

  return Result(result: ids.toList(),
    state: EntitiesState().rebuild((b) => b..entryComments.addAll(commentsMap)));
}

Result normalizeEntry(EntryResponse entry) {
  var mappedEntry = Entry.mapFromResponse(entry);
  var commentsResult = normalizeEntryComments(entry.comments);
  var ids = commentsResult.result;
  ids.insert(0, entry.id);
  return Result(
      state: commentsResult.state.rebuild((b) => b.entries.putIfAbsent(entry.id, () => mappedEntry)),
      result: ids);
}
