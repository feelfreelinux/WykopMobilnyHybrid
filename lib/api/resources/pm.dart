import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

class PmApi extends ApiResource {
  PmApi(ApiClient client) : super(client);

  Future<List<Conversation>> getConversations() async {
    var items = await client
        .request('pm', 'conversationslist');

    return client.deserializeList(ConversationResponse.serializer, items).map((e) => Conversation.mapFromResponse(e)).toList();
  }

  Future<Result> getMessages(int page) async {
    var items = await client
        .request('mywykop', 'tags', named: {'page': page.toString()});
    return normalizeEntryLinkResponse(BuiltList.from(
        client.deserializeList(EntryLinkResponse.serializer, items)));
  }

  Future<Result> sendMessage(int page) async {
    var items = await client
        .request('mywykop', 'users', named: {'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }
}
