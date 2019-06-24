import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

class PmApi extends ApiResource {
  PmApi(ApiClient client) : super(client);

  Future<List<Conversation>> getConversations() async {
    var items = await client.request('pm', 'conversationslist');

    return client
        .deserializeList(ConversationResponse.serializer, items)
        .map((e) => Conversation.mapFromResponse(e))
        .toList();
  }

  Future<List<PmMessage>> getMessages(String receiver) async {
    var items = await client.request('pm', 'conversation', api: [receiver]);

    return client
        .deserializeList(PmMessageResponse.serializer, items)
        .map((e) => PmMessage.mapFromResponse(e))
        .toList();
  }

  Future<Result> sendMessage(int page) async {
    var items = await client
        .request('mywykop', 'users', named: {'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }
}
