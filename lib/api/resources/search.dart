import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class SearchApi extends ApiResource {
  SearchApi(ApiClient client) : super(client);

  Future<List<Entry>> searchEntries(int page, String q) async {
    var items = await client.request('search', 'entries',
        named: {'page': page.toString()}, post: {'q': q});
    return deserializeEntries(items);
  }

  Future<List<Link>> searchLinks(int page, String q) async {
    var items = await client.request('search', 'links',
        named: {'page': page.toString()}, post: {'q': q});
    return deserializeLinks(items);
  }

    Future<List<EntryLink>> searchIndex(int page, String q) async {
    var items = await client.request('search', 'index',
        named: {'page': page.toString()}, post: {'q': q});
    return deserializeEntryLinks(items);
  }
}
