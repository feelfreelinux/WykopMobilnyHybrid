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

  Future<ConversationData> getConversation(String receiver) async {
    var items = await client.request('pm', 'conversation', api: [receiver], returnFullResponse: true);

    var msgs = client
        .deserializeList(PmMessageResponse.serializer, items["data"])
        .map((e) => PmMessage.mapFromResponse(e))
        .toList();
    var author = deserializeAuthor(items["receiver"]);

    print(items);
    return ConversationData(
      messages: msgs,
      receiver: author,
      lastUpdate: items["last_update"],
    );
  }

  Future<List<PmMessage>> getMessages(String receiver) async {
    var items = await client.request('pm', 'conversation', api: [receiver]);

    return client
        .deserializeList(PmMessageResponse.serializer, items)
        .map((e) => PmMessage.mapFromResponse(e))
        .toList();
  }

  Future<PmMessage> sendMessage(String receiver, InputData data) async {
    var pm = await client.request('pm', 'sendmessage',
        api: [receiver], post: {'body': data.body}, image: data.file);
    return PmMessage.mapFromResponse(
      client.deserializeElement(PmMessageResponse.serializer, pm),
    );
  }
}
