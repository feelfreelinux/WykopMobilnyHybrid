import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class TagsApi extends ApiResource {
  TagsApi(ApiClient client) : super(client);

  Future<Result> getIndex(String tag, int page) async {
    var items = await client
        .request('tags', 'index', api: [tag], named: {'page': page.toString()});
    return normalizeEntryLinkResponse(BuiltList.from(
        client.deserializeList(EntryLinkResponse.serializer, items)));
    }

  Future<Result> getLinks(String tag, int page) async {
    var items = await client
        .request('tags', 'links', api: [tag], named: {'page': page.toString()});
    return normalizeLinksResponse(BuiltList.from(
        client.deserializeList(LinkResponse.serializer, items)));
  }

  Future<Result> getEntries(String tag, int page) async {
    var items = await client
        .request('tags', 'entries', api: [tag], named: {'page': page.toString()});
    print(items);
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }
}
