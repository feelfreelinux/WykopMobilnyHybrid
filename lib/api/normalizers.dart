import 'package:owmflutter/api/response_models/entry_link_response.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';

import 'package:built_collection/built_collection.dart';

class Result<T> {
  final List<T> result;
  final EntitiesState state;
  Result({this.result, this.state});
}

Map<int, Entry> entryResponseListToMap(BuiltList<EntryResponse> entries) {
  var mappedEntries = entries.map((c) => Entry.mapFromResponse(c));
  return Map<int, Entry>.from(
      Map.fromIterable(mappedEntries, key: (v) => v.id, value: (v) => v));
}

Result<int> normalizeEntriesResponse(BuiltList<EntryResponse> entries) {
  var entriesMap = entryResponseListToMap(entries);
  var ids = entries.map((e) => e.id);

  return Result<int>(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..entries.addAll(entriesMap)));
}

Map<int, Link> linkResponseListToMap(BuiltList<LinkResponse> links) {
  var mappedLinks = links.map((c) => Link.mapFromResponse(c));
  return Map<int, Link>.from(
      Map.fromIterable(mappedLinks, key: (v) => v.id, value: (v) => v));
}

Result<int> normalizeLinksResponse(BuiltList<LinkResponse> links) {
  var linksMap = linkResponseListToMap(links);
  var ids = links.map((e) => e.id);

  return Result<int>(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..links.addAll(linksMap)));
}

Result<int> normalizeEntryCommentsResponse(
    BuiltList<EntryCommentResponse> comments) {
  var mappedComments = comments == null
      ? Iterable.empty()
      : comments.map((c) => EntryComment.mapFromResponse(c));
  var commentsMap = Map<int, EntryComment>.from(
      Map.fromIterable(mappedComments, key: (v) => v.id, value: (v) => v));
  var ids = comments != null ? comments.map((e) => e.id) : List<int>();

  return Result<int>(
      result: ids.toList(),
      state:
          EntitiesState().rebuild((b) => b..entryComments.addAll(commentsMap)));
}

Result<int> normalizeEntryComment(EntryComment entryComment) {
  return Result<int>(
      state: EntitiesState().rebuild((b) =>
          b.entryComments.putIfAbsent(entryComment.id, () => entryComment)),
      result: [entryComment.id]);
}

Result<int> normalizeEntryResponse(EntryResponse entry) {
  var mappedEntry = Entry.mapFromResponse(entry);
  var commentsResult = normalizeEntryCommentsResponse(entry.comments);
  var ids = commentsResult.result;
  ids.insert(0, entry.id);
  return Result<int>(
      state: commentsResult.state
          .rebuild((b) => b.entries.putIfAbsent(entry.id, () => mappedEntry)),
      result: ids);
}

Result<int> normalizeEntry(Entry entry) {
  return Result<int>(
      state: EntitiesState()
          .rebuild((b) => b.entries.putIfAbsent(entry.id, () => entry)),
      result: [entry.id]);
}

Result<String> normalizeEntryLinkResponse(
    BuiltList<EntryLinkResponse> response) {
  var mappedLinks = linkResponseListToMap(
      response.where((r) => r.link != null).map((r) => r.link));

  var mappedEntries = entryResponseListToMap(
      response.where((r) => r.entry != null).map((r) => r.entry));

  return Result<String>(
      result: response.map((r) => r.entry == null
          ? "link." + r.link.id.toString()
          : "entry" + r.entry.id.toString()),
      state: EntitiesState().rebuild((b) {
        b.links.addAll(mappedLinks);
        b.entries.addAll(mappedEntries);
      }));
}
