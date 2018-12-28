import 'package:owmflutter/api/api.dart';
import 'package:owmflutter/models/models.dart';
import 'package:built_collection/built_collection.dart';

class SuggestApi extends ApiResource {
  SuggestApi(ApiClient client) : super(client);

  Future<List<AuthorSuggestion>> suggestUsers(String q) async {
    var items = await client.request('suggest', 'users', api: [q]);
    return client.deserializeList(AuthorSuggestionResponse.serializer, items).map((a) => AuthorSuggestion.fromResponse(response: a)).toList();
  }

  Future<Result> searchLinks(int page, String q) async {
    var items = await client.request('search', 'links',
        named: {'page': page.toString()}, post: {'q': q});
    return normalizeLinksResponse(
        BuiltList.from(client.deserializeList(LinkResponse.serializer, items)));
  }
}
