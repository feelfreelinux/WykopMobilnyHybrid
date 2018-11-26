import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';

import 'package:built_collection/built_collection.dart';

class Result {
  final List<int> result;
  final EntitiesState state;
  Result({this.result, this.state});
}

Result normalizeEntriesResponse(BuiltList<EntryResponse> entries) {
  var mappedEntries = entries.map((c) => Entry.mapFromResponse(c));
  var entriesMap = Map<int, Entry>.from(
      Map.fromIterable(mappedEntries, key: (v) => v.id, value: (v) => v));
  var ids = entries.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..entries.addAll(entriesMap)));
}

Result normalizeLinksResponse(BuiltList<LinkResponse> links) {
  var mappedLinks = links.map((c) => Link.mapFromResponse(c));
  var linksMap = Map<int, Link>.from(
      Map.fromIterable(mappedLinks, key: (v) => v.id, value: (v) => v));
  var ids = links.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..links.addAll(linksMap)));
}

Result normalizeEntryCommentsResponse(BuiltList<EntryCommentResponse> comments) {
  var mappedComments = comments == null
      ? Map.from({})
      : comments.map((c) => EntryComment.mapFromResponse(c));
  var commentsMap = Map<int, EntryComment>.from(
      Map.fromIterable(mappedComments, key: (v) => v.id, value: (v) => v));
  var ids = comments.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state:
          EntitiesState().rebuild((b) => b..entryComments.addAll(commentsMap)));
}

Result normalizeEntryComment(EntryComment entryComment) {
  return Result(
      state: EntitiesState()
          .rebuild((b) => b.entryComments.putIfAbsent(entryComment.id, () => entryComment)),
      result: [entryComment.id]);
}

Result normalizeEntryResponse(EntryResponse entry) {
  var mappedEntry = Entry.mapFromResponse(entry);
  var commentsResult = normalizeEntryCommentsResponse(entry.comments);
  var ids = commentsResult.result;
  ids.insert(0, entry.id);
  return Result(
      state: commentsResult.state
          .rebuild((b) => b.entries.putIfAbsent(entry.id, () => mappedEntry)),
      result: ids);
}

Result normalizeEntry(Entry entry) {
  return Result(
      state: EntitiesState()
          .rebuild((b) => b.entries.putIfAbsent(entry.id, () => entry)),
      result: [entry.id]);
}
