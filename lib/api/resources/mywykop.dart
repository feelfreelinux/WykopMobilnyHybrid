import 'package:owmflutter/api/api.dart';
import 'package:built_collection/built_collection.dart';
import 'package:owmflutter/models/models.dart';

class MyWykopApi extends ApiResource {
  MyWykopApi(ApiClient client) : super(client);

  Future<Result> getIndex(int page) async {
    var items = await client
        .request('mywykop', 'index', named: {'page': page.toString()});
    var dd = normalizeEntryLinkResponse(BuiltList.from(
        client.deserializeList(EntryLinkResponse.serializer, items)));

    return dd;
  }

  Future<Result> getTags(int page) async {
    var items = await client
        .request('mywykop', 'tags', named: {'page': page.toString()});
    return normalizeEntryLinkResponse(BuiltList.from(
        client.deserializeList(EntryLinkResponse.serializer, items)));
  }

  Future<Result> getUsers(int page) async {
    var items = await client
        .request('mywykop', 'users', named: {'page': page.toString()});
    return normalizeEntriesResponse(BuiltList.from(
        client.deserializeList(EntryResponse.serializer, items)));
  }
}
