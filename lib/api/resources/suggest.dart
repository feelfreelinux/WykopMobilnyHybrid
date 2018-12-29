import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

class SuggestApi extends ApiResource {
  SuggestApi(ApiClient client) : super(client);

  Future<List<AuthorSuggestion>> suggestUsers(String q) async {
    var items = await client.request('suggest', 'users', api: [q]);
    return client
        .deserializeList(AuthorSuggestionResponse.serializer, items)
        .map((a) => AuthorSuggestion.fromResponse(response: a))
        .toList();
  }

  Future<List<TagSuggestion>> suggestTags(String q) async {
    var items = await client.request('suggest', 'tags', api: [q]);
    return client
        .deserializeList(TagSuggestionResponse.serializer, items)
        .map((a) => TagSuggestion.fromResponse(response: a))
        .toList();
  }
}
