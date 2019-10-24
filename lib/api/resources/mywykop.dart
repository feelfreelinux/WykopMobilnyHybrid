import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class MyWykopApi extends ApiResource {
  MyWykopApi(ApiClient client) : super(client);

  Future<List<EntryLink>> getIndex(int page) async {
    var items = await client
        .request('mywykop', 'index', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  Future<List<EntryLink>> getTags(int page) async {
    var items = await client
        .request('mywykop', 'tags', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  Future<List<EntryLink>> getUsers(int page) async {
    var items = await client
        .request('mywykop', 'users', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }
}
