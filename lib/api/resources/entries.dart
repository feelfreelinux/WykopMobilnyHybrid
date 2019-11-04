import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/api/api.dart' as prefix0;
import 'package:owmflutter/api/response_models/voter_response.dart';
import 'package:owmflutter/models/models.dart';
import 'package:owmflutter/models/voter.dart';

class EntriesApi extends ApiResource {
  EntriesApi(ApiClient client) : super(client);
  Future<List<Entry>> getFavorite(int page) async {
    var items = await client
        .request('entries', 'observed', named: {'page': page.toString()});
    return client
        .deserializeList(EntryResponse.serializer, items)
        .map((e) => Entry.mapFromResponse(e))
        .toList();
  }

  Future<List<Entry>> getHot(int page, String period) async {
    var items = await client.request('entries', 'hot',
        named: {'period': period, 'page': page.toString()});
    return client
        .deserializeList(EntryResponse.serializer, items)
        .map((e) => Entry.mapFromResponse(e))
        .toList();
  }

  Future<List<Entry>> getNewest(int page) async {
    var items = await client
        .request('entries', 'stream', named: {'page': page.toString()});
    return client
        .deserializeList(EntryResponse.serializer, items)
        .map((e) => Entry.mapFromResponse(e))
        .toList();
  }

  Future<List<Entry>> getActive(int page) async {
    var items = await client
        .request('entries', 'active', named: {'page': page.toString()});
    return client
        .deserializeList(EntryResponse.serializer, items)
        .map((e) => Entry.mapFromResponse(e))
        .toList();
  }

  Future<Entry> getEntry(int id) async {
    var items = await client.request('entries', 'entry', api: [id.toString()]);
    return Entry.mapFromResponse(
      client.deserializeElement(EntryResponse.serializer, items),
    );
  }
  
  Future<EntryComment> addEntryComment(int entryId, InputData data) async {
    var comment = await client.request('entries', 'commentadd',
        api: [entryId.toString()], post: {'body': data.body}, image: data.file);
    print(comment);
    return deserializeEntryComment(comment);
  }

  Future<List<Voter>> getEntryUpVoters(int entryId) async {
    var items =
        await client.request('entries', 'upvoters', api: [entryId.toString()]);
    print(items);
    var voters = client.deserializeList(VoterResponse.serializer, items);
    return voters.map((e) => Voter.fromResponse(response: e)).toList();
  }

  Future<Entry> addEntry(InputData data) async {
    var entry = await client.request('entries', 'add',
        post: {'body': data.body}, image: data.file);
    return deserializeEntry(entry);
  }

  Future<int> voteUp(int id) async {
    var voteCount =
        await client.request('entries', 'voteup', api: [id.toString()]);

    return int.parse(voteCount["vote_count"]);
  }

  Future<bool> markFavorite(int id) async {
    var res = await client.request('entries', 'favorite', api: [id.toString()]);
    return res["user_favorite"] as bool;
  }

  Future<int> voteDown(int id) async {
    var voteCount =
        await client.request('entries', 'voteremove', api: [id.toString()]);
    print(voteCount);
    return int.parse(voteCount["vote_count"]);
  }

    Future<int> voteComemntUp(int id) async {
    var voteCount =
        await client.request('entries', 'commentvoteup', api: [id.toString()]);

    return int.parse(voteCount["vote_count"]);
  }

  Future<void> deleteEntry(int id) async {
      await client.request('entries', 'delete', api: [id.toString()]);
  }
  
  Future<void> deleteComment(int id) async {
      await client.request('entries', 'commentdelete', api: [id.toString()]);
  }

  Future<int> voteCommentDown(int id) async {
    var voteCount =
        await client.request('entries', 'commentvoteremove', api: [id.toString()]);
    print(voteCount);
    return int.parse(voteCount["vote_count"]);
  }
}
