import 'package:owmflutter/api/response_models/entry_link_response.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';
import 'package:owmflutter/api/api.dart';

import 'package:built_collection/built_collection.dart';

class Result {
  final List result;
  final EntitiesState state;
  Result({this.result, this.state});
}

Map<int, Entry> entryResponseListToMap(BuiltList<EntryResponse> entries) {
  var mappedEntries = entries.map((c) => Entry.mapFromResponse(c));
  return Map<int, Entry>.from(
      Map.fromIterable(mappedEntries, key: (v) => v.id, value: (v) => v));
}

Map<int, Author> authorResponseListToMap(BuiltList<AuthorResponse> authors) {
  var mappedAuthors = authors.map((c) => Author.fromResponse(response: c));
  return Map<int, Author>.from(
      Map.fromIterable(mappedAuthors, key: (v) => v.id, value: (v) => v));
}

Result normalizeEntriesResponse(BuiltList<EntryResponse> entries) {
  var entriesMap = entryResponseListToMap(entries);
  var ids = entries.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..entries.addAll(entriesMap)));
}

Result normalizeNotificationsResponse(
    BuiltList<NotificationResponse> notifications) {
  var notificationsMap = notificationResponseListToMap(notifications);
  var ids = notifications.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState()
          .rebuild((b) => b..notifications.addAll(notificationsMap)));
}

Result normalizeRelatedResponse(
    BuiltList<RelatedResponse> relatedLinks) {
  var relatedMap = relatedResponseListToMap(relatedLinks);
  var ids = relatedLinks.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState()
          .rebuild((b) => b..relatedLinks.addAll(relatedMap)));
}

Map<int, Notification> notificationResponseListToMap(
    BuiltList<NotificationResponse> notifications) {
  var mappedNotifications =
      notifications.map((c) => Notification.mapFromResponse(c));
  return Map<int, Notification>.from(
      Map.fromIterable(mappedNotifications, key: (v) => v.id, value: (v) => v));
}

Map<int, Related> relatedResponseListToMap(
    BuiltList<RelatedResponse> relatedLinks) {
  var mappedRelated =
      relatedLinks.map((c) => Related.mapFromResponse(c));
  return Map<int, Related>.from(
      Map.fromIterable(mappedRelated, key: (v) => v.id, value: (v) => v));
}

Map<int, Link> linkResponseListToMap(BuiltList<LinkResponse> links) {
  var mappedLinks = links.map((c) => Link.mapFromResponse(c)).toList();
  return Map<int, Link>.from(
      Map.fromIterable(mappedLinks, key: (v) => v.id, value: (v) => v));
}

Map<int, LinkComment> linkCommentResponseListToMap(
    BuiltList<LinkCommentResponse> linkComments) {
  var mappedLinkComments = linkComments
      .map((c) => LinkComment.mapFromResponse(
          c,
          linkComments
              .where((d) => d.parentId == c.id && d.id != c.id)
              .map((d) => d.id)
              .toList()))
      .toList();
  return Map<int, LinkComment>.from(
      Map.fromIterable(mappedLinkComments, key: (v) => v.id, value: (v) => v));
}

Result normalizeLinksResponse(BuiltList<LinkResponse> links) {
  var linksMap = linkResponseListToMap(links);
  var ids = links.map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState().rebuild((b) => b..links.addAll(linksMap)));
}

Result normalizeLinkCommentsResponse(
    BuiltList<LinkCommentResponse> linkComments) {
  var linkCommentsMap = linkCommentResponseListToMap(linkComments);
  var ids = linkCommentsMap.values
      .toList()
      .where((c) => c.id == c.parentId)
      .map((e) => e.id);

  return Result(
      result: ids.toList(),
      state: EntitiesState()
          .rebuild((b) => b..linkComments.addAll(linkCommentsMap)));
}

Result normalizeLinkComment(LinkComment linkComment) {
  return Result(
      state: EntitiesState().rebuild((b) =>
          b.linkComments.putIfAbsent(linkComment.id, () => linkComment)),
      result: [linkComment.id]);
}

Result normalizeEntryCommentsResponse(
    BuiltList<EntryCommentResponse> comments) {
  var mappedComments = comments == null
      ? Iterable.empty()
      : comments.map((c) => EntryComment.mapFromResponse(c));
  var commentsMap = Map<int, EntryComment>.from(
      Map.fromIterable(mappedComments, key: (v) => v.id, value: (v) => v));
  var ids = comments != null ? comments.map((e) => e.id) : List<int>();

  return Result(
      result: ids.toList(),
      state:
          EntitiesState().rebuild((b) => b..entryComments.addAll(commentsMap)));
}

Result normalizeEntryComment(EntryComment entryComment) {
  return Result(
      state: EntitiesState().rebuild((b) =>
          b.entryComments.putIfAbsent(entryComment.id, () => entryComment)),
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

Result normalizeLinkResponse(LinkResponse link) {
  var mappedLink = Link.mapFromResponse(link);
  return Result(
      state: EntitiesState().rebuild((b) => b.links.putIfAbsent(link.id, () => mappedLink)),
      result: [link.id]);
}

Result normalizeEntryCommentResponse(EntryCommentResponse entryComment) {
  var mappedEntryComment = EntryComment.mapFromResponse(entryComment);
  return Result(
      state: EntitiesState()
          .rebuild((b) => b.entryComments.putIfAbsent(entryComment.id, () => mappedEntryComment)),
      result: [mappedEntryComment.id]);
}

Result normalizeEntry(Entry entry) {
  return Result(
      state: EntitiesState()
          .rebuild((b) => b.entries.putIfAbsent(entry.id, () => entry)),
      result: [entry.id]);
}

Result normalizeEntryLinkResponse(BuiltList<EntryLinkResponse> response) {
  var mappedLinks = linkResponseListToMap(BuiltList.from(
      response.where((r) => r.link != null).map((r) => r.link).toList()));

  var mappedEntries = entryResponseListToMap(BuiltList.from(
      response.where((r) => r.entry != null).map((r) => r.entry).toList()));

  return Result(
      result: response
          .map((r) => r.entry == null ? r.link.id : r.entry.id * 1000)
          .toList(),
      state: EntitiesState().rebuild((b) {
        b.links.addAll(mappedLinks);
        b.entries.addAll(mappedEntries);
      }));
}
