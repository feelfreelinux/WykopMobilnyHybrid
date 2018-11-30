import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/store/store.dart';

class EntriesApi extends ApiResource {
  EntriesApi(ApiClient client) : super(client);

  Future<Result> getHot(int page, String period) async {
    var items = await client.request('entries', 'hot',
        named: {'period': period, 'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getNewest(int page) async {
    var items = await client
        .request('entries', 'stream', named: {'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getActive(int page) async {
    var items = await client
        .request('entries', 'active', named: {'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }

  Future<Result> getEntry(int id) async {
    var items = await client.request('entries', 'entry', api: [id.toString()]);
    return normalizeEntryResponse(
        client.deserializeElement(EntryResponse.serializer, items));
  }

  Future<Result> voteUp(Entry entry) async {
    var voteCount =
        await client.request('entries', 'voteup', api: [entry.id.toString()]);
    var updatedEntry = entry.rebuild((b) => b
      ..voteCount = int.parse(voteCount["vote_count"])
      ..isVoted = true);

    return normalizeEntry(updatedEntry);
  }

  Future<Result> voteDown(Entry entry) async {
    var voteCount = await client
        .request('entries', 'voteremove', api: [entry.id.toString()]);
    var updatedEntry = entry.rebuild((b) => b
      ..voteCount = int.parse(voteCount["vote_count"])
      ..isVoted = false);

    return normalizeEntry(updatedEntry);
  }

  Future<Result> commentVoteUp(EntryComment entry) async {
    var voteCount = await client
        .request('entries', 'commentvoteup', api: [entry.id.toString()]);
    var updatedEntry = entry.rebuild((b) => b
      ..voteCount = int.parse(voteCount["vote_count"])
      ..isVoted = true);

    return normalizeEntryComment(updatedEntry);
  }

  Future<Result> commentVoteDown(EntryComment entry) async {
    var voteCount = await client
        .request('entries', 'commentvoteremove', api: [entry.id.toString()]);
    var updatedEntry = entry.rebuild((b) => b
      ..voteCount = int.parse(voteCount["vote_count"])
      ..isVoted = false);

    return normalizeEntryComment(updatedEntry);
  }
}
